---
title: Realm Status API
---
Realm Status API
================

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

*Under construction, more coming soon!*