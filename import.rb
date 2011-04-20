# from the standard library :
require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
require 'time'

# gem install to_slug if you don't have it already. 
require 'to_slug'

source = "http://notuntitled.com/rss"                                 # put your feed url here
content = ""                                # this is just initializing the string
open(source) do |s| content = s.read end 
rss = RSS::Parser.parse(content, false)

rss.items.each do |item|
  filename = "_posts/#{item.date.strftime("%Y-%m-%d")}-#{item.title.to_slug.sub(/-\Z/,"")}.html"
  file = File.new(filename, "w+")
  file.puts "---\nlayout: post\ntitle: \"#{item.title}\"\ndate: #{item.date.strftime("%Y-%m-%d")}\n---\n#{item.description}"
  file.close
end