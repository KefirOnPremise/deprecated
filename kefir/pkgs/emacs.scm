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
	(base32 "0m08k5zmwxnz0limhc5f7wajnf7inc2x4klvy6d1hdjj54wdljcx"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/KefirOnPremise/kefir-stuff")
    (synopsis "my emacs package")
    (description "my emacs package")
    (license license:gpl3+)))

(define-public emacs-soothe-theme
  (let ((commit "0786fe70c6c1b4ddcfb932fdc6862b9611cfc09b")
        (revision "0"))
    (package
      (name "emacs-soothe-theme")
      (version (git-version "0.1" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/emacsfodder/emacs-soothe-theme.git")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32 "10gh1hvxq9gm29r6qzlnva7vjidd7n4kih4z2ihyvbvy9za20xqw"))))
      (build-system emacs-build-system)
      (home-page "https://github.com/emacsfodder/emacs-soothe-theme.git")
      (synopsis "A colorful, but muted theme for Emacs 24, dark background with light text")
      (description
       "An amalgam of muted color tones and highlighted backgrounds.  Builtin support 
for rainbow-delimiters, org-mode, whitespace-mode, ECB, flyspell, ido, linum, highlight
indentation, show-paren-mode, further mode support to come.")
      (license license:gpl3+))))

(define-public emacs-sanityinc-tomorrow
  (package
    (name "emacs-sanityinc-tomorrow")
    (version "1.17")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/purcell/color-theme-sanityinc-tomorrow")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "1x3aq6hadp158vh8mf9hmj5rikq0qz7a1frv7vbl39xr3wcnjj23"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/purcell/color-theme-sanityinc-tomorrow")
    (synopsis "A set of comprehensive Emacs color themes based on Chris Kempson's 'tomorrow' themes")
    (description
     "An Emacs version of Chris Kempson's 'Tomorrow' themes,with much
more extensive face definitions than the 'official' Emacs variant.
The themes work with both the built-in theming support in recent Emacsen,
and via the traditional color-theme.el add-on library in older versions,
so use whichever you prefer.")
    (license license:gpl3+)))
