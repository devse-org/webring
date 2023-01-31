const devseWebringFrom = webring => url => {

    const urlIs = end => url => url.endsWith(end);
    const urlIsOnion = urlIs(".onion");
    const urlIsI2p = urlIs(".i2p");

    const getNetworkFromUrl = url => {
        if (urlIsOnion(url)) {
            return "onion";
        }
        if (urlIsI2p(url)) {
            return "i2p";
        }

        return "clearnet";
    };

    const getHttpFromEntry = entry => entry['protocols']['http'];
    const findMember = url => webring.findIndex(entry => {
        const network = getNetworkFromUrl(url);
        const http = getHttpFromEntry(entry);

        return typeof http[network] === "string" && http[network].startsWith(url);
    });

    const getUrlFromNetworkAndEntryWithFallback = network => entry => {
        const http = getHttpFromEntry(entry);

        if (network in http) {
            return http[network];
        }

        return http['clearnet'];
    };

    const displayHtml = data => {
        let element = document.getElementById("devse-webring");
        element.insertAdjacentHTML("afterbegin", data);
    };

    const getEntry = id => id < 0 ? webring[webring.length - 1] : webring[id % webring.length];
    const getNext = id => getEntry(id + 1);
    const getPrev = id => getEntry(id - 1);
    const getRandom = () => getEntry(Math.floor(Math.random() * webring.length));

    const displayWebring = url => id => {
        const getUrlFromEntryWithFallback = getUrlFromNetworkAndEntryWithFallback(getNetworkFromUrl(url));
        const randomUrl = getUrlFromEntryWithFallback(getRandom());
        const nextUrl = getUrlFromEntryWithFallback(getNext(id));
        const prevUrl = getUrlFromEntryWithFallback(getPrev(id));

        displayHtml(`
        <ul>
                <li><a href="${prevUrl}">previous</a></li>
                <li><a href="${randomUrl}">random</a></li>
                <li><a href="${nextUrl}">next</a></li>
        </ul>
        `);
    };

    const checkMember = url => {
        const id = findMember(url);
        if (id >= 0) {
            return displayWebring(url)(id);
        }

        displayHtml("This website isn't part of DevSE webring");
    };

    checkMember(url);
};

const devseWebring = devseWebringFrom(devse_webring_list);

try {
    devseWebring(devse_webring_current_url);
} catch (e) {
    console.error(e);
    devseWebring(window.location.origin);
}
