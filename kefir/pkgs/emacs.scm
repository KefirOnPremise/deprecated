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
	(base32 "0wnf2b3dlj0y5c0y5xs6g53fq7kmw7wm867km2rln3vxgjcwrk6f"))))
    (build-system emacs-build-system)
    (arguments
     `(#:include '("\\.el$")))
    (home-page "https://github.com/KefirOnPremise/kefir-stuff")
    (synopsis "")
    (description
     "")
    (license license:gpl3+)))
