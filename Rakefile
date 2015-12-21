require './flickr_creds'

task :new_post, [:post_name, :image_dir] do |t, args|
  time = Time.now
  date = time.strftime('%Y-%m-%d')
  slug = args.post_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') #slug the title, to make a filemanmt

  file = File.open("_posts/#{date}-#{slug}.markdown", "w")
  file.puts <<-eom
---
layout: post
title: #{args.post_name}
date: #{time.strftime('%Y-%m-%d %H:%M:%S %z')}
ogimage: "#{urls(args.image_dir).first if args.image_dir}"
description: "Something clever here"
---

<span style="display:block;" class="center">
  #{images(args.image_dir)}
</span>
eom
  file.close
end

def images(dir)
  dir ? urls(dir).map{|info| "![#{info[:title]}](#{info[:url]})" }.join("\n") : []
end

def urls(dir)
  File.exists?(path + dir) ? local_files(path+dir) : flickr_urls(dir)
end

def path
  path = "/Users/#{ENV['USER']}/Desktop/"
end

def local_files(dir)
  files = Dir.entries(dir).select { |filename|  !File.directory?("#{dir}/#{filename}") }
  sh "scp -r #{dir} matt@notuntitled.com:~/public_html/images"
  files.map { |file| { url: "http://photomattmills.com/images/#{dir.gsub(path, "")}/#{file}" } }
end

def flickr_urls(list_name)
  sets = flickr.photosets.getList(user_id: user_id)  # my user id
  set_id = sets.select{|a| a.title == list_name}.last["id"] rescue nil
  photos = flickr.photosets.getPhotos(photoset_id: set_id, user_id: user_id, extras:"url_o") if set_id
  urls = photos["photo"].map { |photo| {url: photo["url_o"], title: photo["title"] } } if photos
end

def user_id
  "33027018@N06" #  my user id
end
