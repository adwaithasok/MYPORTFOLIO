'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2fdacce498c172b953765b18e290ec10",
"assets/AssetManifest.bin.json": "8b99fd678415abefc48bce31bddced8e",
"assets/AssetManifest.json": "80d2dd2b40a6e23a3c902d80fea22141",
"assets/assets/blog/blog.json": "ac413815410cfd3adea60600067de4c6",
"assets/assets/icons/andoidsdk.webp": "1ce5848ba269e43fcf6c708aadd2d42d",
"assets/assets/icons/Android.png": "5de1859bcb9a02700e13925219148bda",
"assets/assets/icons/androidsdk.webp": "1ce5848ba269e43fcf6c708aadd2d42d",
"assets/assets/icons/chatgpt.png": "85069d572ac01867becd3a72729a5893",
"assets/assets/icons/deployment.webp": "5b9e2f181f1f59998ba5a50f4499b3d0",
"assets/assets/icons/facebook.svg": "e0385b4391520ea38476e9fc74f22509",
"assets/assets/icons/figma.png": "6b7cd45c08eb858cb9eee7685d17597e",
"assets/assets/icons/firebase.png": "de1546f8bcc43f9252f70ff7509e468b",
"assets/assets/icons/flutter.png": "218c4c5df83b068f8cb476f89832d5dd",
"assets/assets/icons/git.png": "f150476b880137dc9105a0a3738473c5",
"assets/assets/icons/github.jpg": "d2ac787afab9c6ec4f31fc887b1f8481",
"assets/assets/icons/github.png": "ec3a60c8c6539a07eb70b52f6737ea6e",
"assets/assets/icons/github.svg": "6a8f33d6cb09f28be597a885e460d047",
"assets/assets/icons/gmaps.png": "d29f7cbde852ac20bc0fdbe8c6aeb154",
"assets/assets/icons/html.png": "b78e5ad36383439db8f37ccd7985224e",
"assets/assets/icons/linkedin.png": "b2597cd80c8da3f8d26d0c1bfb5ed71d",
"assets/assets/icons/linkedin.svg": "c20e472dbbe47e5809cf79a0b4e283e4",
"assets/assets/icons/payment.webp": "7ccc55604f3886e9664a96cc8d40341e",
"assets/assets/icons/postman.png": "4bf11727ffcc86ef61bf0dfe3fb050f2",
"assets/assets/icons/react.png": "12ee442c5056b776f293f2e8a64398b3",
"assets/assets/icons/rest_api.png": "d07ef4028fbd3b6645afb28b07ac892d",
"assets/assets/icons/vscode.png": "33c09d7a3e6f3669243b2c8d6d927bd3",
"assets/assets/icons/wordpress.png": "db4298ab4dbd04c9e9a2395533a01082",
"assets/assets/icons/xcode.png": "007d3bc3426362d438a44f105ea61fae",
"assets/assets/images/adv1.jpg": "71bad7efb27d2e2b4d67416b27e139ff",
"assets/assets/images/adv10.webp": "d6ced479096712a3b9a0309172251d94",
"assets/assets/images/adv11.webp": "a425f396282b1d3e7ce568b0ac3a77c3",
"assets/assets/images/adv12.webp": "064c5faad04f76cb5f13b4b1769f713d",
"assets/assets/images/adv2.jpg": "0bb13fbd22df684ddd9660223f1d05e7",
"assets/assets/images/adv3.webp": "78af588013c40fe5fc754bf21591f2aa",
"assets/assets/images/adv4.jpg": "c13c8279e10d1934fb78fb60c007c1eb",
"assets/assets/images/adv5.webp": "8051eb97a835aa1547f65cedc265701a",
"assets/assets/images/adv6.webp": "1cb4d24fcc729b5b62e4d2419a31f890",
"assets/assets/images/adv7.webp": "32b8788fbce18c4eea4ece131adc1108",
"assets/assets/images/adv8.jpg": "77822139f777154c7408c8ef6b0cb111",
"assets/assets/images/adv9.webp": "d93514dc592e3516fef10daaef7bf8c2",
"assets/assets/images/async-await.png": "7a4ba9bfabde5e482c6c86d677576202",
"assets/assets/images/avatar.jpg": "97aed67e18ea9a5af892014016c184c1",
"assets/assets/images/di4lsod.png": "8e5ed195b583ad967d97a09dc4e665a5",
"assets/assets/images/fx_managers.png": "fc3b188b5b8ac87ac106592743b710d5",
"assets/assets/images/health_app.png": "2cad23af9e06da701b3ea57d78af853a",
"assets/assets/images/java-generics.png": "10f062ba34a4defba99b23951ceaf51a",
"assets/assets/images/java-interview.png": "9c8bd066bb3fbbea3fea3d6c0dd72ebb",
"assets/assets/images/java-oop.png": "8793b14be8ffcf6c1cb805f7abae80ed",
"assets/assets/images/java-patterns.png": "40497d191749528bf9bc97923d2905cb",
"assets/assets/images/js-coercion.png": "6a628a16551056d37421ec6341babe78",
"assets/assets/images/js-concepts.png": "cc71b1f2f185eef95634fa64a6b87380",
"assets/assets/images/js-interview.png": "2f6a157524d000a509ce4b506efb6047",
"assets/assets/images/js-naming.png": "dca5c6b2acf2ad321c8c9e63b66774eb",
"assets/assets/images/koala_pet.png": "4037a92385df376fb3197cf01b98215f",
"assets/assets/images/matrimony_app.png": "3f35b076c5c9a2fcfb1e6cba37361755",
"assets/assets/images/office.jpg": "d36be8dc52e8b20842e0cd91a9fe181c",
"assets/assets/images/office1.jpg": "a54c307dd4e47ce44f3ea44d8ac69238",
"assets/assets/images/office2.jpg": "5f7cf6d4414e5fa44646465a7ec2c171",
"assets/assets/images/office3.jpg": "534727b0affbee09757477e32a7c3257",
"assets/assets/images/office4.jpg": "441e1b7cbfcee275db8df1229f0a2d5a",
"assets/assets/images/project1.png": "524632208de8c5e0eb89e68fec63eec9",
"assets/assets/images/project2.png": "19a033badaf3885d86905224a0d66825",
"assets/assets/images/project3.png": "37ac5a46e9bdc9dba27b0951ee4a10f8",
"assets/assets/images/roommates.jpg": "babca05287ba7af0ada333dcb8929b0e",
"assets/assets/images/roommates1.jpg": "a02f1856f7a4efaca80843dfdae0cf6b",
"assets/assets/images/roommates2.jpg": "6aa24f7372a6059df3527c212e9e3be2",
"assets/assets/images/roommates3.webp": "84d3438c6a8e736b8d9d0fecab0a4072",
"assets/assets/resume/resume.json": "3686e446b60d1388468ad13b1a6c08a5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "a4b3281504a44f84dd393bed34f2dd68",
"assets/NOTICES": "52b14da6fe7e17be0f88d7afeab6d196",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "221d8416aaf47ee1d264633c8d16bc57",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9dfa3b31eecb79fedac72a03cf06e59a",
"/": "9dfa3b31eecb79fedac72a03cf06e59a",
"main.dart.js": "420d97ba36eab3f5e5c6c5538238cf8d",
"manifest.json": "af267b2ba0b9b45ca93e7ffbb79b422e",
"version.json": "05316cf0b2e44f329429d0f0ea44154c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
