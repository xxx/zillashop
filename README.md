Zillashop
=========

A Ruby on Rails plugin for interacting with the Shopzilla Catalog API.

Installation
============

    script/plugin install git://github.com/xxx/zillashop.git

Configuration
=============

Create a `zillashop.yml` in app/config that looks something like...

    development:
      :api_key: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      :publisher_id: 11111

    staging:
      :api_key: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      :publisher_id: 11111

    production:
      :api_key: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
      :publisher_id: 11111

... replacing the api_key and publisher_id placeholders with your own values
received from Shopzilla.

Usage
=====

    zilla = Zillashop.new

    zilla.product(:keyword => 'apple ipod')
    zilla.taxonomy(:keyword => 'apple ipod')
    zilla.brand(:keyword => 'apple')
    zilla.merchant_info(:keyword => 'amazon')

Search methods return a result object created from the XML results received from Shopzilla.
See the docs for more info.

Other Shopzilla parameters can be passed into the search methods as well.
Either the raw name from Shopzilla (e.g. `'maxPrice'` or `:maxPrice`) or
more Ruby-like naming (e.g. `'max_price'` or `:max_price`) should work.
Please see the Shopzilla documentation for their canonical list of parameters.

Full documentation online at [http://yardoc.org/docs/xxx-zillashop](http://yardoc.org/docs/xxx-zillashop)

YARD documentation can be generated locally with the `yardoc` command if you have the yard gem installed.

Copyright & Disclaimer
======================

Copyright (c) 2010 Michael Dungan, michael@tennmandigital.com, released under the MIT license

This plugin is not owned or endorsed by Shopzilla or BizRate in any way.
