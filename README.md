# webring

entry example:
```scm
    ((name  . "Wiki DevSE")
	 (description . "French documentation on the creation of operating systems")
	 (assets
	  (80x15 . "devsewiki.png"))
	 (protocols
	  (http (clearnet . "https://devse.wiki/"))))
```

spec:

```ocaml

type assets = {
    ?80x15: string option;
    ?88x31: string option;
}

type network = {
    clearnet: string;
    ?onion: string option;
    ?i2p: string option;
}

type protocols = {
    http: network;
    ?gemini: network option;
    ?gopher: network option;
    ?ipfs: string option;
    ?freenet: string option;
}

type entry = {
    name: string;
    description: string;
    ?assets: assets option;
    protocols: protocols;
}

```