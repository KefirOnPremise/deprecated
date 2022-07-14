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
	(base32 "0c9lknrhwhi4v3qnnzmy0k24d8pr3d3mpxi9xzcxq97f5w1x4fsk"))))
     (build-system emacs-build-system)
     (arguments
      `(#:include '("\\.el$" "\\.info$" "\\.texi$")))
     (home-page "https://github.com/webframp/sicp-info")
     (synopsis "Stucture and Interpretation of Computer Progams in info format")
     (description "After the installation, Sicp will appear in Info, the documentation browser.")
     (license #f))))

(define-public emacs-soothe-theme
  ;; there is no named branch
  (let ((commit "0786fe70c6c1b4ddcfb932fdc6862b9611cfc09b")
	(revision "0"))
    (package
     (name "emacs-soothe-theme")
     (version "20141027.2233")
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/emacsfodder/emacs-soothe-theme")
	     (commit commit)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "10gh1hvxq9gm29r6qzlnva7vjidd7n4kih4z2ihyvbvy9za20xqw"))))
     (build-system emacs-build-system)
     (home-page "https://github.com/emacsfodder/emacs-soothe-theme.git")
     (synopsis "Colorful, but muted theme for Emacs, dark background with light text")
     (description
      "Soothe theme is an amalgam  of muted color tones and highlighted backgrounds.  It has
builtin support for rainbow-delimiters, org-mode, whitespace-mode, ECB, flyspell, ido, linum, highlight
indentation, show-paren-mode.")
     (license license:gpl3))))
