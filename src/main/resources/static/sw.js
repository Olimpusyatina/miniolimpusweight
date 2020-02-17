const staticCacheName = 'static-cache-v0';
const dynamicCacheName = 'dynamic-cache-v0';
const staticAssets = [
     '/',
    // '/history',
    './images/icons/icon-72x72.png',
    './images/icons/icon-96x96.png',
    './images/icons/icon-128x128.png',
    './images/icons/icon-144x144.png',
    './images/icons/icon-152x152.png',
    './images/icons/icon-192x192.png',
    './images/icons/icon-384x384.png',
    './images/icons/icon-512x512.png',
    './js/app.js'
];
self.addEventListener('install', async  () => {
    const cache = await caches.open(staticCacheName);
    await cache.addAll(staticAssets);
    console.log('Success install');
});
self.addEventListener('activate', async  () => {
    const cachesKeys = await caches.keys();
    cachesKeys.map(async key => {
        if (staticCacheName !== key) {
            await caches.delete(key);
        }
    });
    await Promise.all(cachesKeys);
    console.log('Success activation');
});
self.addEventListener('fetch', event =>{
    console.log('Trying to fetch ${event.request.url}');
    event.respondWith(checkCache(event.request));
});

async function checkCache(req){
    const cachedResponse = await caches.match(req);
    return cachedResponse || await checkOnline(req);
}

async function checkOnline(req){
    const cache = await caches.open(dynamicCacheName);
    try {
        const res = fetch(req);
        await cache.put(req, res.clone());
        return res;
    } catch (error) {
        return await cache.match(req);
    }
}