(define-module (kefir pkgs commonlisp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial))

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
	       (url "")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32 "10gh1hvxq9gm29r6qzlnva7vjidd7n4kih4z2ihyvbvy9za20xqw"))))
      (build-system trivial-build-system)
      (native-inputs
       (list libtool autoconf automake gcc-toolchain make))
      (arguments
       `(#:modules ((guix build utils))
	 #:builder
	 (begin
           (use-modules (guix build utils))
	   (let ((out    (assoc-ref %outputs "out")))
	     (mkdir-p (string-append out "/lib"))
	     (invoke "libtoolize")))))
      (home-page "")
      (synopsis "")
      (description
       "")
      (license license:expat))))
