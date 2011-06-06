---
title: Realm Status API
---
Realm Status API
================

    {region}.battle.net/api/wow/realm/status

The Realm Status API returns data about the status of one or more realms in a region.

Introduction
------------

[BLIZZQUOTE Straton http://us.battle.net/wow/en/forum/topic/2369741469]
The first API released is the realm status API. Following a RESTful model, this API can be ccessed using the following base url: /api/wow/realm/status.

The following query string parameters can be optionally used when using this resource:

* realm – Any number of realm query string parameters can be added to the request to specify which realms should be returned.
* jsonp – Specify a JSONP callback method to wrap around the JSON payload.

This API returns JSON data, but the "jsonp" parameter can be used to quickly embed this data nto your website.

With that, an example URL and it's payload would look like this:

[http://us.battle.net/api/wow/realm/status?realm=Medivh](http://us.battle.net/api/wow/realm/status?realm=Medivh)

The following url would return the entire list of realms and their statuses:

[http://us.battle.net/api/wow/realm/status](http://us.battle.net/api/wow/realm/status)

Multiple realms can also be specified:

[http://us.battle.net/api/wow/realm/status?realm=Medivh&realm=Blackrock](http://us.battle.net/api/wow/realm/status?realm=Medivh&realm=Blackrock)
[/BLIZZQUOTE]

Response
--------

The API response for the API is a list of realms with associated data, presented as an array of objects. Each object has the following properties:

|---
| Property | Data Type | Description
|:-|:-|:-
| name | string | the fully formatted name of the realm, e.g. "Blade's Edge"
| slug | string | "data friendly" version of name, with punctuation removed and spaces converted to dashes, e.g. "blades-edge"
| type | string | the type of the realm, will be one of "pve", "pvp", "rp", "rppvp"
| status | boolean | `true` if the realm is up, `false` if it is down
| queue | boolean | `true` if the realm has a queue to play, `false` if it does not
| population | string | the realm's population, one of "low", "medium", "high", or will be "n/a" if the realm is down
|---

Specifying a Single Realm
-------------------------

When specifying a realm via the `realm` parameter, you can use the realm's name (such as `Nazjatar`) or the realm's slug (such as `aerie-peak` for "Aerie Peak"). If the realm name contains a space, you may encode it with `%20` or `+`, e.g. `Aerie%20Peak` or `Aerie+Peak`.

Specifying Multiple Realms
--------------------------

If you wish to specify multiple realms, you may do so in one of two ways:

  1. Specify multiple `realm` paramters*, e.g. `?realm=nazjatar&realm=aerie-peak`; or
  2. Specify a comma-separated list of realms for the `realms` (with an "s") paramter, e.g. `?realms=nazjatar,aerie-peak`

If you use the first method, you may specify each realm either by slug or by name (if the name contains no spaces or special characters, there is no difference). If, however, you use the second method, you must use the realm's slug (`?realms=nazjatar,aerie-peak` will work but `?realms=nazjatar,aerie+peak` and `?realms=nazjatar,aerie%20peak` will not).

\* **Note** that, [according to Straton](http://us.battle.net/wow/en/forum/topic/2592851202#12), support for multiple `realm` parameters will be removed, so it is suggested that you use the `realms` parameter. In the same post, Straton also mentions that not being able to specify realm names with spaces in a `realms` CSV list is also a bug and will be fixed.

Determining a Realm's Slug
--------------------------

Though Blizzard has not disclosed their realm slugging algorithm, there has been some community discussion in the forums about it, especially starting in [posts 15 and 16 of the "Community Platform API Feedback" thread](http://us.battle.net/wow/en/forum/topic/2592851202#15):

> ...0x439 is a unicode code point representing the character 'й'. You can also represent that character as the sequence 0x0438 0x0306, which is и followed by a combining character to add the accent. There's a defined normalisation process to reach that decomposed state; it's the NFKD process (normalised form, canonical, decomposed). If you apply it, then remove all the combining characters, you wind up with something that seems to match the slug test, at least for European realms.
>
> In Python:
>
>     >>> s = u'\u0439'
>     >>> nfkd_form = unicodedata.normalize('NFKD', unicode(s))
>     >>> s = u"".join([c for c in nfkd_form if not unicodedata.combining(c)])
>     >>> s
>     u'\u0438'
>
>
> Not all languages have a unicode normalisation library, though. In practice, the entire EU realm list is slugified by (unicode) lowercasing it, stripping hyphens and single quotes, then replacing é with e, ü with u, й with и, and space with hyphen.
