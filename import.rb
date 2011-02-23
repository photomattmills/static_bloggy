require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
require 'time'
require 'rubygems'
require 'to_slug'

source = "http://photomattmills.com/rss.txt"# url or local file
content = "" # raw content of rss feed will be loaded here
open(source) do |s| content = s.read end
rss = RSS::Parser.parse(content, false)

rss.items.each do |item|
  filename = "#{item.date.strftime("%Y-%m-%d")}-#{item.title.to_slug.sub(/-\Z/,"")}.html"
  file = File.new(filename, "w+")
  file.puts "---\nlayout: post\ntitle: #{item.title}\ndate: #{item.date.strftime("%Y-%m-%d")}\n---\n#{item.description}"
  file.close
end