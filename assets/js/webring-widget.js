const devse_webring_is_onion = (url) => (url.endsWith(".onion"));
const devse_webring_is_i2p = (url) => (url.endsWith(".i2p"));
const devse_webring_get_network = (url) => {
    if (devse_webring_is_onion(url)) {
        return "onion";
    }

    if (devse_webring_is_i2p(url)) {
        return "i2p";
    }

    return "clearnet";
}
const devse_webring_get_network_matching_url = (url, entry) => (entry['protocols']['http'][devse_webring_get_network(url)]);
const devse_webring_find_member = (url) => (devse_webring_list.findIndex((entry) => {
    let target = devse_webring_get_network_matching_url(url, entry);
    console.log(target);
    return (typeof target === "string" && target.startsWith(url));
}));
const devse_webring_get_url_with_fallback = (entry, network) => {
    http = entry['protocols']['http'];
    if (network in http) {
        return http[network];
    }

    return http['clearnet'];
}
const devse_webring = (url) => {
    let element = document.getElementById("devse-webring");
    let member_id = devse_webring_find_member(url);

    if (member_id >= 0) {
        const network = devse_webring_get_network(url);
        const random = devse_webring_list[Math.floor(Math.random() * devse_webring_list.length)];

        const random_url = devse_webring_get_url_with_fallback(random, network);

        const next = devse_webring_list[(member_id + 1) % devse_webring_list.length];
        const prev = (member_id - 1) < 0 ? devse_webring_list[devse_webring_list.length - 1] : devse_webring_list[member_id - 1];

        const next_url = devse_webring_get_url_with_fallback(next, network);
        const prev_url = devse_webring_get_url_with_fallback(prev, network);

        element.insertAdjacentHTML("afterbegin", `
        <ul>
                <li><a href="${prev_url}">previous</a></li>
                <li><a href="${random_url}">random</a></li>
                <li><a href="${next_url}">next</a></li>
        </ul>
        `);
    } else {
        element.insertAdjacentHTML("afterbegin", "This website isn't part of DevSE webring");
    }
}

try {
    devse_webring(devse_webring_current_url);
} catch (e) {
    console.error(e);
    devse_webring(window.location.origin);
}
