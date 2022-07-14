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
	(base32 "1q2wn1w79gm8pc38x74vi30yyr0b00j9aaaqq13s2pcgbm0ny68d"))))
    (build-system emacs-build-system)
    (arguments
     `(#:include '("\\.el$")))
    (home-page "https://github.com/KefirOnPremise/kefir-stuff")
    (synopsis "my emacs package")
    (description "my emacs package")
    (license license:gpl3+)))

(define-public emacs-sicp
  ;; named branch is outdated
  (let ((commit "4002d83083d520c6b5ede2df36cc2cee885d450a")
        (revision "1"))
    (package
     (name "emacs-sicp")
     (version (git-version "0.0.0" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/webframp/sicp-info")
	     (commit commit)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "1q2wn1w79gm8pc38x74vi30yyr0b00j9aaaqq13s2pcgbm0ny68d"))))
     (build-system emacs-build-system)
     (arguments
      `(#:include '("\\.el$" "\\.info$" "\\.texi$")))
     (home-page "https://github.com/webframp/sicp-info")
     (synopsis "")
     (description "")
     (license #f))))
