# webring

entry example:
```
{
    "name": "Site name",
    "assets": {
        "80x15": "name.png",
        "88x31": "name.gif"
    },
    "protocol": {
        "http": {
            "clearnet": "https://name.devse/",
            "onion": "http://xxxxx.onion",
            "i2p": "http://xxxxx.i2p"
        },
        "gemini": "gemini://name.devse/",
        "gopher": "gopher://name.devse/",
        "ipfs": "ipfs://xxx",
        "freenet": "XXXXXXXX"
    }
}
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

type protocol = {
    http: network;
    ?gemini: network option;
    ?gopher: network option;
    ?ipfs: string option;
    ?freenet: string option;
}

type entry = {
    name: string;
    ?assets: assets option;
    protocol: protocol;
}

```