#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

dewiki = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://de.wikipedia.org/wiki/11._Seimas',
  before: '//span[@id="Weblinks"]',
  xpath: '//li/a[not(@class="new")][1]/@title',
  as_ids: true,
)

query = <<SPARQL
  SELECT DISTINCT ?item WHERE {
    ?item p:P39 [ ps:P39 wd:Q18507240 ; pq:P2937 ?term ] .
    ?term p:P31/pq:P1545 ?ordinal .
    FILTER (xsd:integer(?ordinal) >= 11)
  }
SPARQL
p39s = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: dewiki | p39s)
