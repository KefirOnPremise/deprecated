(define-module (kefir pkgs emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs))

(define-public emacs-kefir-stuff
  (package
    (name "emacs-kefir-stuff")
    (version "v1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/KefirOnPremise/kefir-stuff")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "0n16jnvf7gywa19r5c4vfv2s5j6fhd50bv5i3fj5crr8zpmanh8l"))))
    (build-system emacs-build-system)
    (arguments
     `(#:include '("\\.el$")))
    (home-page "https://github.com/KefirOnPremise/kefir-stuff")
    (synopsis "my emacs package")
    (description "my emacs package")
    (license license:gpl3+)))
