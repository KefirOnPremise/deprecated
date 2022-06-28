(define-module (kefir services desktop)
  #:use-module (gnu)
  #:use-module (gnu services desktop)
  #:use-module (gnu services networking)
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)
  #:export (my-system-supplementary-groups
	    my-system-packages
	    my-system-services))

(define my-system-supplementary-groups
  '("wheel" "netdev" "audio" "video"))

(define my-system-packages
  (cons*
    (specification->package "emacs")
    (specification->package "emacs-exwm")
    (specification->package
     "emacs-desktop-environment")
    (specification->package "emacs-magit")
    (specification->package "emacs-kefir-stuff")
    (specification->package "nss-certs")
    %base-packages))

(define my-system-services
  (cons*
   (service openssh-service-type)
   (modify-services
    %desktop-services
    (guix-service-type
     config => (guix-configuration
		(inherit config)
		(substitute-urls '("https://mirror.sjtu.edu.cn/guix/")))))))
