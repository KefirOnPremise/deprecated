(define-module (kefir pkgs emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs))

(define-public emacs-kefir-stuff
  (package
    (name "emacs-kefir-stuff")
    (version "add_backup")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/KefirOnPremise/kefir-stuff")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "1qybljz5rpnjlzbgx19dxds745hkz9ahw0zhmhfzh1i6bbkn91ij"))))
    (build-system emacs-build-system)
    (arguments
     `(#:include '("\\.el$" "^images/" "^latex/" "\\.info$")))
    (home-page "https://github.com/KefirOnPremise/kefir-stuff")
    (synopsis "my emacs package")
    (description "my emacs package")
    (license license:gpl3+)))
