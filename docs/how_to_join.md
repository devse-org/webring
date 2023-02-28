title: How to join
---

# How to join 

First you **MUST** be an active member of the DevSE discord server and follow [our community standards](/docs/code-of-conduct.html)

If you meet these requirements you can now [fork the repository](https://github.com/devse-org/webring) and edit the file `webring.scm`.

A minimal website entry must fill the following field: `name`, `description` and **HTTP(S)** __**clearnet**__ URL.

```scheme
    ((name . "Wiki DevSE")
	 (description . "French documentation on the creation of operating systems")
	 (protocols
	  (http (clearnet . "https://devse.wiki/"))))
```

And then send a pull request.