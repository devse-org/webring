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
      (http (clearnet . "https://cyp.sh/"))))
	((name . "QDNix")
	 (description . "Quick'n'dirty *NIX")
	 (assets
	  (88x31 . "qdnix.gif"))
	 (protocols
	  (http (clearnet . "https://qdnix.d0p1.eu/"))))
     ((name . "Lou !'s site")
     (description . "Lou ! personal website, sometimes a working search engine")
     (protocols
      (http (clearnet . "https://habert.me/"))))
     ((name . "Smooth Projects")
     (description . "A simple project manager")
     (protocols
      (http (clearnet . "https://smoop.carbonlab.dev/"))))
	 ((name . "StupidOS")
	  (description . "32-bit Operating System written in x86 assembly.")
    (assets
	   (88x31 . "stupidos.png")
     (80x15 . "stupidos.png"))
	  (protocols
	   (http (clearnet . "https://stupidos.d0p1.eu"))))
    	 ((name . "SEaC")
	  (description . "Systeme d'Exploitation approximativement Complet")
	  (protocols
	   (http (clearnet . "https://n-lg.github.io/seac"))))
        ))
