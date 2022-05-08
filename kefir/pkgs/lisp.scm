(define-module (kefir pkgs lisp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system asdf)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages lisp-xyz))

(define-public sbcl-zip
  ;; named branch is outdated
  (let ((commit "688b1545dd7a4fe355556768bb03f8bd9b847a87")
        (revision "1"))
    (package
      (name "sbcl-zip")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
               (url "https://github.com/bluelisp/zip")
               (commit commit)))
	 (sha256
	  (base32
	   "0s08a6fq182fzsbfyvihqbdllq6gxcwkvphxnrd9wwz65dhg5y66"))
	 (file-name (git-file-name name version))))
      (build-system asdf-build-system/sbcl)
      (inputs
       `(("sbcl-salza2" ,sbcl-salza2)
	 ("sbcl-trivial-gray-streams" ,sbcl-trivial-gray-streams)
	 ("sbcl-babel" ,sbcl-babel)
	 ("sbcl-cl-fad" ,sbcl-cl-fad)))
      (arguments
       ;; TODO: Tests fail because they require quicklisp to run.
       `(#:tests? #f))
      (synopsis "zip library written in Common Lisp")
      (description "Library for .zip-file reading and writing, written in Common Lisp.")
      (home-page "https://zip.common-lisp.dev")
      (license license:expat))))
