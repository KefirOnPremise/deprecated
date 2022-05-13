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
	(base32 "1x6kxns48hz1bkq9kyac4zxahzra9c3pd5557z5js6gx6w2fpwam"))))
    (build-system go-build-system)
    (home-page "https://github.com/KefirOnPremise/TestDaemon")
    (synopsis "")
    (description
     "")
    (license license:gpl3+)))
