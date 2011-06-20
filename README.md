This is the source for http://wowapi.info, which contains documentation for the Blizzard Community Platform API. If you wish to contribute to the project, please:

  1. Fork this repository.
  2. Make your changes and push to your forked repository.
  3. Issue a pull request.

Writing API Documentation
-------------------------

All API documentation should live in `content/api/`, one file per API. The table of contents is in `layouts/default.html` and should be updated to reflect any new pages.

Within a document, content is written in [Kramdown](http://kramdown.rubyforge.org/). Each document should have a single first-level heading which will be part of the `<title>` of the document.

Each API document should include, at the top, the basic URL structure for the API call, followed by a small paragraph of text summing up the API. Following that, as a general, rule, there should be the following second-level headings and associated sections in an API document:

  1. Introduction: any additional basic info, including Blizzard-employee forum quotes.
  2. Request: any information about how to format the URL for the API request, sperated into third-level headings if necessary
  3. Response: information about the response from the API call

For a good idea about how a document should be laid out, see the `content/api/realm.md` file. However, **if you wish to contribute but aren't sure about the formatting**, go ahead and add what you can, and I will take care of extra formatting or layout when I process the pull request.

Using nanoc
-----------

The site is built using nanoc. Assuming you are using Bundler to manage your gems, you can install the necessary gems using `bundle install` and start the auto-compiler via `bundle exec rake auto`. This will start a web server on localhost port 3000; visit http://localhost:3000 in a browser to view the site. nanoc will recompile files as you modify them, so simply refresh your browser to see your changes.

The Blizzquote Filter
---------------------

To create a Blizzard-employee quote block, use the following syntax:

    [BLIZZQUOTE Name http://us.battle.net/path/to/forum/post/url]
    Something a blue said!
    [/BLIZZQUOTE]

The filter at `lib/blizzquote_filter.rb` will insert the necessary HTML to format the quote correctly.
