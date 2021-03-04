require 'nokogiri'
require 'open-uri'

require_relative '../poros/sample.rb'
class SamplesController < ApplicationController
  # uses nokogiri's output to instantiate sample and creator objects and assign them attributes, then establishes the sample-creator relationship
  def index
    @samples = []
    #goes to search for most downloaded in past 24 hours
    data = URI.open("https://www.looperman.com/loops?page=1&order=downloads&dir=d&when=1")
    doc = Nokogiri::HTML(data)
    doc.css("div#body-content").css("div div.player-wrapper").each do |sample_bundle|
      #instantiates new sample and provides it with scraped attributes
          the_sample = Sample.new
          the_sample.creator = sample_bundle.css(".player-sub-title").css(".icon-user").text
          the_sample.title = sample_bundle.css(".player-title").text
          the_sample.url = sample_bundle.attributes['rel'].value
          the_sample.download_count = sample_bundle.css("div .player-stats-wrapper").css(".stats-downloads").text
      #instantiates a new sample and establishes sample-creator relationship
          # sample_creator = Creator.new
          # the_sample.creator = sample_creator
      #dives into the sample's url to retrieve "bpm" and "key" tags
          url = sample_bundle.css("div .player-stats-wrapper").css("a").attr("href").text
          sample_page = Nokogiri::HTML(open(url))
          the_sample.bpm = sample_page.css("div .tag-wrapper a").text.match(/\d\d\d\s(bpm)/).to_s
          the_sample.key = sample_page.css("div .tag-wrapper a").text.match(/(Key)\s[:]\s\w/).to_s
      #makes key either "unknown" or single letter
            if the_sample.key == "Key : U"
              the_sample.key = "Key unknown"
            else
              the_sample.key = the_sample.key.sub(/(Key)\s[:]\s/, "")
            end
      #inserts the sample into the Sample.all array
          @samples << the_sample #this should happen within initialize statement
        end
    #returns all the samples
    @samples #unnecessary...
  end
end