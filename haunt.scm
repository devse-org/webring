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
 (haunt reader skribe))

(define %website-title
  "DevSE webring")

(define %webring-json
  (call-with-input-file "webring.json" get-string-all))

(format #t "~a ~%" %webring-json)

(define-json-type <network>
  (clearnet)
  (onion)
  (i2p))

(define-json-type <protocols>
  (http "http" <network>)
  (gemini)
  (gopher)
  (ipfs)
  (freenet))

(define-json-type <assets>
  (badge "80x15")
  (button "88x31"))

(define-json-type <entry>
  (name)
  (description)
  (assets "assets" <assets>)
  (protocols "protocols" <protocols>))

(format #t "~s ~%" (json-string->scm %webring-json))

(define (page-template site body)
  `((doctype html)
	(head
	 (meta (@ (charset "utf-8")))
	 (title %website-title))
	(body 
	 (div ,body))))

(define (index-page site posts)
  (make-page
   "index.html"
   (page-template site `(p "soon"))
   sxml->html))

(site #:title %website-title
	  #:domain "//webring.devse.wiki"
	  #:default-metadata '(
						   (author . "DevSE contributors"))
      #:readers (list skribe-reader)
	  #:builders (list
				  index-page
				  (static-directory "assets")))
