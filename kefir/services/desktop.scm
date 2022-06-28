(define-module (kefir services desktop)
  #:use-module (gnu services)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages nfs)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages gnome)
  #:use-module (gnu services xorg)
  #:use-module (gnu services base)
  #:use-module (gnu services desktop)
  #:use-module (gnu services sddm)
  #:use-module (gnu services networking)
  #:use-module (gnu services dbus)
  #:use-module (gnu services sound)
  #:use-module (gnu services avahi)
  #:use-module (gnu services ssh)
  #:use-module (gnu services docker)
  #:use-module (gnu system setuid)
  #:use-module (gnu system keyboard)
  #:export (%kefir-desktop-services
	    %my-desktop-services
	    %bordeaux-public-key
	    %kefir-desktop-packages))

(define* (desktop-services-for-system #:optional
                                      (system (or (%current-target-system)
                                                  (%current-system))))
  ;; List of services typically useful for a "desktop" use case.
  (cons* (service sddm-service-type)

         ;; Screen lockers are a pretty useful thing and these are small.
         (screen-locker-service xlockmore "xlock")

         ;; Add udev rules for MTP devices so that non-root users can access
         ;; them.
         (simple-service 'mtp udev-service-type (list libmtp))
         ;; Add udev rules for scanners.
         (service sane-service-type)
         ;; Add polkit rules, so that non-root users in the wheel group can
         ;; perform administrative tasks (similar to "sudo").
         polkit-wheel-service

         ;; Allow desktop users to also mount NTFS and NFS file systems
         ;; without root.
         (simple-service 'mount-setuid-helpers setuid-program-service-type
                         (map (lambda (program)
                                (setuid-program
                                 (program program)))
                              (list (file-append nfs-utils "/sbin/mount.nfs")
                               (file-append ntfs-3g "/sbin/mount.ntfs-3g"))))

         ;; The global fontconfig cache directory can sometimes contain
         ;; stale entries, possibly referencing fonts that have been GC'd,
         ;; so mount it read-only.
         fontconfig-file-system-service

         ;; NetworkManager and its applet.
         (service network-manager-service-type)
         (service wpa-supplicant-service-type)    ;needed by NetworkManager
         (simple-service 'network-manager-applet
                         profile-service-type
                         (list network-manager-applet))
         (service modem-manager-service-type)
         (service usb-modeswitch-service-type)

         ;; The D-Bus clique.
         (service avahi-service-type)
         (udisks-service)
         (service upower-service-type)
         (accountsservice-service)
         (service cups-pk-helper-service-type)
         (service colord-service-type)
         (geoclue-service)
         (service polkit-service-type)
         (elogind-service)
         (dbus-service)

         (service ntp-service-type)

         x11-socket-directory-service

         (service pulseaudio-service-type)
         (service alsa-service-type)

	 (service openssh-service-type)
	 (service tor-service-type)
	 (service docker-service-type)

         %base-services))

(define-syntax %kefir-desktop-services
  (identifier-syntax (desktop-services-for-system)))

(define %bordeaux-public-key "(public-key
 (ecc
  (curve Ed25519)
  (q #7D602902D3A2DBB83F8A0FB98602A754C5493B0B778C8D1DD4E0F41DE14DE34F#)
  )
 )")

(define %kefir-desktop-packages
  '((list (specification->package "emacs")
          (specification->package "emacs-exwm")
          (specification->package
           "emacs-desktop-environment")
	  (specification->package "emacs-magit")
	  (specification->package "emacs-kefir-stuff")
          (specification->package "nss-certs"))))
