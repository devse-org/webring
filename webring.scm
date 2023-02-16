(define-module (webring)
  #:export (site-list))

(define site-list
  #(((name  . "Wiki DevSE")
	 (description . "French documentation on the creation of operating systems")
	 (assets
	  (80x15 . "devsewiki.png"))
	 (protocols
	  (http (clearnet . "https://devse.wiki/"))))
    ((name . "BRUTAL")
     (description . "The BRUTAL operating system")
     (protocols
      (http (clearnet . "https://brutal.smnx.sh/"))))
    ((name . "skiftOS")
     (description . "The skift operating system")
	 (protocols
	  (http (clearnet . "https://skiftos.org/"))))
    ((name . "cyp blog")
     (description . "Cyp personal blog and website")
     (protocols
      (http (clearnet . "https://cyp.sh/")))) ))
