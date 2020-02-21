const staticCacheName = 'static-cache-v3';
const dynamicCacheName = 'dynamic-cache-v1';
const staticAssets = [
     '/',
    '/offline.html',
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
    const checkKeys = cachesKeys.map(async key => {
        if (staticCacheName !== key) {
            await caches.delete(key);
        }
    });
    await Promise.all(checkKeys);
    console.log('Success activation');
});

self.addEventListener('fetch', event =>{
    console.log(`Trying to fetch ${event.request.url}`);
    event.respondWith(checkCache(event.request));
});

async function checkCache(req){
    const cachedResponse = await caches.match(req);
    return cachedResponse || checkOnline(req);
}

async function checkOnline(req) {
    const cache = await caches.open(dynamicCacheName);
    try {
        const res = await fetch(req);
        await cache.put(req, res.clone());
        return res;
    } catch (error){
        const cachedRes = await cache.match(req);
        if (cachedRes){
            return cachedRes;
        } else return await caches.match('./offline.html')
        // return await cache.match(req);
    }
}

























// self.addEventListener('fetch', function (event) {
//
//     event.respondWith(
//
//         caches.open(staticCacheName).then(function (cache) {
//             return cache.match(event.request).then(function (response) {
//                 return response || fetch(event.request).then(function (response) {
//                     cache.put(event.request, response.clone());
//                     return response;
//                 });
//             });
//         })
//
//     );
//
// });