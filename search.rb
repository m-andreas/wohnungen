require 'mechanize'
require 'awesome_print'
agent = Mechanize.new

flats = []

flats << agent.get('https://www.wohnen.at/angebot/unser-wohnungsangebot/').css(".unit-results .tile-text").select{|c| c.text.include? "1220"}.map{|title| {company:"Neues Leben", title: title.text.gsub(/\s+/," ").strip, link: "https://www.wohnen.at" + title.ancestors("a")[0]["href"].to_s}}

ap flats