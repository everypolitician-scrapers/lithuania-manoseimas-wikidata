#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Seimas_2012–2016',
  before: '//span[@id="Weblinks"]',
  xpath: '//li/a[not(@class="new")][1]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { lv: [], en: [], de: names }, output: true)
warn EveryPolitician::Wikidata.notify_rebuilder

