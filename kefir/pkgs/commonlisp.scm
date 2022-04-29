(define-module (kefir pkgs commonlisp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
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
      (build-system trivial-build-system)
      (native-inputs
       `(("libtool" ,libtool)
	 ("autoconf" ,autoconf)
	 ("automake" ,automake)
	 ("gcc-toolchain" ,gcc-toolchain)
	 ("make" ,gnu-make)))
      (arguments
       `(#:modules ((guix build utils))
	 #:builder
	 (begin
           (use-modules (guix build utils))
	   (let ((source (assoc-ref %build-inputs "source"))
		 (libtoolize (assoc-ref %build-inputs "libtool"))
		 (out (assoc-ref %outputs "out"))
		 (tmp "/tmp"))
	     (mkdir-p (string-append out "/lib"))
	     (mkdir-p (string-append tmp "/tmp-" source))

	     (let ((copyFile (lambda (file)
			       (copy-file (string-append source "/" file)
					  (string-append tmp "/" file)))))
	       (copyFile "/Makefile.am")
	       (copyFile "/configure.ac")
	       (copyFile "/src/async-process.asd")
	       (copyFile "/src/async-process.c")
	       (copyFile "/src/async-process.h")
	       (copyFile "/src/async-process.lisp"))

	     (let ((copyFile (lambda (file)
			       (copy-file (string-append tmp "/" file)
					  (string-append out "/" file)))))
	       (copyFile "/Makefile.am")
	       (copyFile "/configure.ac")
	       (copyFile "/src/async-process.asd")
	       (copyFile "/src/async-process.c")
	       (copyFile "/src/async-process.h")
	       (copyFile "/src/async-process.lisp"))

	     ;; (copy-file (string-append tmp "/Makefile.am")
	     ;; 		(string-append out "/lib" "/Makefile.am"))

	     ;; (invoke (string-append libtoolize "/bin/libtoolize"))
	     ;; (invoke "aclocal")
	     ;; (invoke "autopheader")
	     ;; (invoke "automake" "-a")
	     ;; (invoke "autoconf")
	     ;; (invoke "./configure")
	     ;; (invoke "make")
	     ;; (copy-file "/.libs/libasyncprocess.so"
	     ;; 		(string-append out "/lib/"))
	     ))))
      (home-page "")
      (synopsis "")
      (description
       "")
      (license license:expat))))
