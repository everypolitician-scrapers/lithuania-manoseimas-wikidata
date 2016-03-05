#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_Seimas_2012–2016',
  before: '//span[@id="Weblinks"]',
  xpath: '//li/a[not(@class="new")][1]/@title',
) 

missing = %w(Q1261946 Q3610379 Q15782189 Q9160077 Q12649485 Q270330 Q12679521)

EveryPolitician::Wikidata.scrape_wikidata(ids: missing, names: { lv: [], en: [], de: names }, output: false)

