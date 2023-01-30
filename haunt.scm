(use-modules
 (ice-9 textual-ports)
 (ice-9 streams)
 (json)
 (haunt asset)
 (haunt site)
 (haunt html)
 (haunt page)
 (haunt builder assets)
 (haunt builder blog)
 (haunt builder atom)
 (haunt reader skribe)
 (webring))

(define %website-title
  "DevSE webring")

(define* (page-template site body #:key title)
  `((doctype html)
	(head
	 (meta (@ (charset "utf-8")))
	 (title ,(if title
				 (string-append title " -- DevSE")
				 (site-title site)))
	 (body 
	  (div ,body)))))

(define (index-page site posts)
  (make-page
   "index.html"
   (page-template site `(p "soon"))
   sxml->html))

(define (webring-json-page site posts)
  (make-page
   "webring.json"
   site-list
   scm->json))

(site #:title %website-title
	  #:domain "//webring.devse.wiki"
	  #:default-metadata '(
						   (author . "DevSE contributors"))
      #:readers (list skribe-reader)
	  #:builders (list
				  index-page
				  webring-json-page
				  (static-directory "assets")))
