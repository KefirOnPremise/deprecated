(define-module (kefir pkgs commonlisp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages commencement))

;; guix shell libtool autoconf automake gcc-toolchain make --
;; libtoolize
;; aclocal
;; autoheader
;; automake -a
;; autoconf
;; ./configure
;; make

(define-public async-process
  (let ((commit "8f059c6f937be2caad6392d90f685bf35a92a5f2")
        (revision "0"))
    (package
      (name "async-process")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/lem-project/async-process")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32 "0vlhyj4rrkb1bhl1xjf25d1nv09hzpfl6hwymqkn7h6gr2fdp8m1"))))
      (build-system gnu-build-system)
      (inputs
       `(("libtool" ,libtool)
	 ("autoconf" ,autoconf)
	 ("automake" ,automake)
	 ("gcc-toolchain" ,gcc-toolchain)
	 ("gnu-make" ,gnu-make)))
      ;; ("grep" ,grep)
      ;; ("sed" ,sed)))
      (arguments
       '(#:phases (modify-phases %standard-phases
                    (add-before 'bootstrap 'patch
                      (lambda* (#:key inputs #:allow-other-keys)
			;; Use the right shell when executing user-provided
			;; shell commands.
			(let ((bash (assoc-ref inputs "bash")))
                          (substitute* '("bootstrap")
                            (("\"/bin/sh\"")
			     "/bin/env bash")
			    (("make copy")
                             "")))))
		    (replace 'bootstrap
		      (lambda _
			(invoke "libtoolize")
			(invoke "aclocal")
			(invoke "autoheader")
			(invoke "automake" "-a")
			(invoke "autoconf")

;; ./configure
;; make

			)))))
      (home-page "")
      (synopsis "")
      (description
       "")
      (license license:expat))))
