#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Seimas_2012–2016',
  before: '//span[@id="Weblinks"]',
  xpath: '//li/a[not(@class="new")][1]/@title',
) 

missing = [1261946, 3610379, 15782189, 9160077, 12649485, 270330, 12679521]

EveryPolitician::Wikidata.scrape_wikidata(ids: missing, names: { lv: [], en: [], de: names }, output: false)

