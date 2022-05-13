(define-module (kefir pkgs go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go))

(define-public go-TestDaemon
  (package
    (name "go-TestDaemon")
    (version "initial_program")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/KefirOnPremise/TestDaemon")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "0sly92qjk8jj6z3lpnk76jf9204vdfq7b8jwvkksx9pmd7d0ag15"))))
    (build-system go-build-system)
    (home-page "https://github.com/KefirOnPremise/TestDaemon")
    (synopsis "")
    (description
     "")
    (license license:gpl3+)))
