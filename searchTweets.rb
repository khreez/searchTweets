#!/usr/bin/env ruby
require 'rubygems'
require 'open-uri'
require 'json'

def search(params)
  url = 'http://search.twitter.com/search.json?q=' + params + '&rpp=10'
  
  buffer = open(url, "UserAgent" => "Ruby-Wget").read

  # convert JSON data into a hash
  data = JSON.parse(buffer)

  results = data['results']

  results.each do |tweet|
    puts '@' + tweet['from_user'] + ' ' + tweet['text']
  end

end

query = ''

if (!ARGV[0].nil?)
  query = ARGV[0]
else
  query = '%40Indigo_IT'
end

search(query)

