'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "24832d6fffc45bde4b3b271d0d96dedb",
"assets/assets/AR.jpg": "06490e826dfe34123c81338a133b5476",
"assets/assets/AR1.jpg": "abf34865a20df645fb21fad44e97f5b5",
"assets/assets/bg1.jpg": "24a3ba485adc18f8e505c1717b202cf3",
"assets/assets/bg2.jpg": "9e93c7e6a6010067df43aa9d58e664fa",
"assets/assets/discover1.jpg": "0530c08bfb001cc8c5ed9a4281f34b09",
"assets/assets/flutter.png": "d21f1eecaeaab081ba7efec1721c0712",
"assets/assets/fullscreen.jpg": "df5a33671f287160298604d3372b5d85",
"assets/assets/getStarted.jpg": "2538f208bd95125344166efe1422f3ef",
"assets/assets/images/earth.jpg": "1694d7e3b515dbb38394a9cb3cbc882e",
"assets/assets/images/earth.png": "377ccc56c880b1dc0f61f77a33936f5a",
"assets/assets/images/earth2.png": "2a18dacb2da1ee45e05396ab14f6ad0b",
"assets/assets/images/forgotPasswordBG.png": "c68681f8395304db838f3046ee8db9a3",
"assets/assets/images/globe.jpg": "e37c5785f48e0c104e8c2d2939075b6e",
"assets/assets/images/icon_map.png": "f2b32298916056085058d81457dfe5f0",
"assets/assets/images/lock_icon_map.png": "68402b26dbbcfb20e878aaf3329b8646",
"assets/assets/images/LogIn_bg.png": "86d69a3b8d6a15fbdadaed7630d69e4d",
"assets/assets/images/registerBG.png": "ba897040e9b4ab59c2e42f8464528454",
"assets/assets/images/replace.jpg": "9162c04ca841f8baf8fea8e0ceac2c97",
"assets/assets/images/spaceBg.jpg": "952d581455326b837deb50efca938b53",
"assets/assets/images/UpscaledLogoBlack.png": "846212c592600c424c1b0f2ca4fa0256",
"assets/assets/images/UpscaledLogoWhite.png": "8d1cea6ab01a26cd68500f237c9275f7",
"assets/assets/img1.jpg": "1c11df7b10929fe20cbae60d9e4a068e",
"assets/assets/img2.jpg": "53fccaf3108f36c49d25e5b83f81033f",
"assets/assets/img3.jpg": "22ed268aacd7667a16c2744dcac42f6f",
"assets/assets/likeComment.jpg": "e091642535757ae9a9719e910eda5966",
"assets/assets/tag.jpg": "915a4c83203f029f19841d2ea32c1462",
"assets/FontManifest.json": "8104ba5b783caa0a14ca6f2e1371df13",
"assets/fonts/FiraCode-VariableFont_wght.ttf": "ca3ebb34ddd32492162f9ff9b0ab1345",
"assets/fonts/Lobster-Regular.ttf": "c3191f3b933ae0bd46335e178744326e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/Nunito-VariableFont_wght.ttf": "bc1d0d2571eadab780ef9f510fb6675c",
"assets/fonts/OpenSans-VariableFont.ttf": "996d0154a25c63500dee2ae91e4f2ea7",
"assets/NOTICES": "f91eefcc3199b7d8903c76206f94d435",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b00363533ebe0bfdb95f3694d7647f6d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "0a94bab8e306520dc6ae14c2573972ad",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "9cda082bd7cc5642096b56fa8db15b45",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.ico": "bc1bf77e2e3456491b8410b877c5db5c",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e740fc7c5116c1907292b3c2fd9291b4",
"/": "e740fc7c5116c1907292b3c2fd9291b4",
"main.dart.js": "4a63f1b2af0e2f41aceccc1d63f69b83",
"manifest.json": "73d4615e699eb0edcad671a8e212e728",
"version.json": "c64daf4c35b350f5d64f10b8e99b1e67"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
