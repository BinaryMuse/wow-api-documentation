Blizzard Community Platform API Documentation
=============================================

The [Blizzard Community Platform API](http://us.battle.net/wow/en/forum/2626217/) exposes data already served by the World of Warcraft community site to developers.

The API can be accessed through the base URI `/api/wow` for each region using the HTTP protocol. The default payload is JSON, and JSONP callbacks can be specified using the `jsonp` query string parameter. The Web and Mobile Team plans on supporting [Protocol Buffers](http://code.google.com/apis/protocolbuffers/docs/overview.html) at a future date.[^protocol-buffer-support]

Authentication and Registration
-------------------------------

Although not yet implemented, the Community Platform API will use a voluntary registration model, which will allow those who register and then authenticate their registration in API calls to make more requests than anonymous users of the API. Anonymous access to the API will still be allowed.[^registration]

URL Buildup
-----------

A tpyical URL for use with the API looks like this:[^url-buildup]

    http://{region}.battle.net/api/wow/realm/status?realm={realm_name}
           |_________________| |_____| |__________| |________________|
                    |             |         |               |
                  Domain       Base URI  API Path       Parameters

The **domain** is made up of the region, followed by `.battle.net`. For example, in the US, the domain is `us.battle.net`. The domain is always followed by the **base API URI** of `/api/wow/`.

The **API path** differs based on the API that is being accessed. In this example, we are accessing the [Realm Status API](/api/realm.html). Finally, one or more **parameters** can be passed via a query string.

API Responses
-------------

The default payload for an API response is JSON, and looks like this (this example uses the API call <http://us.battle.net/api/wow/realm/status>):

    {
      "realms":[
        {
          "type":"pvp",
          "queue":false,
          "status":true,
          "population":"low",
          "name":"Aegwynn",
          "slug":"aegwynn"
        },
        {
          "type":"pve",
          "queue":false,
          "status":true,
          "population":"high",
          "name":"Aerie Peak",
          "slug":"aerie-peak"
        },
        ...
      ]
    }

If you wish to access the data via JSONP, pass a callback via the `jsonp` query string parameter. For example, here is the response for <http://us.battle.net/api/wow/realm/status?jsonp=mycallback>:

    mycallback({
      "realms":[
        {
          "type":"pvp",
          "queue":false,
          "status":true,
          "population":"low",
          "name":"Aegwynn",
          "slug":"aegwynn"
        },
        {
          "type":"pve",
          "queue":false,
          "status":true,
          "population":"high",
          "name":"Aerie Peak",
          "slug":"aerie-peak"
        },
        ...
      ]
    });

Currently, the data is pretty-printed, but this will likely be removed once the APIs are finalized.[^json-pretty-print] You can also set your `Accept-Encoding` header to `gzip` to get gzipped content.

---

[^url-buildup]: Blabbermouth, [Comunity Platform API Feedback](http://us.battle.net/wow/en/forum/topic/2592851202#1) on the Community Platform API Forums

[^registration]: Straton, [Authentication and Registration Overview](http://us.battle.net/wow/en/forum/topic/2369881359) on the Community Platform API Forums

[^protocol-buffer-support]: Straton, [Web Services plans](http://us.battle.net/wow/en/forum/topic/2593004215#2) on the Community Platform API Forums

[^json-pretty-print]: Straton, [[RFC] collapsable white space characters](http://us.battle.net/wow/en/forum/topic/2548997698#7) on the Community Platform API Forums
