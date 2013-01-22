task :new_post, [:post_name, :image_dir] do |t, args|
  puts ENV['USER']
  img_dir = "/Users/#{ENV['USER']}/Desktop/#{args.image_dir}"
  
  files = Dir.entries(img_dir).select { |filename|  !File.directory?("#{img_dir}/#{filename}") }  
  images = files.map {|file| "<img src='http://photomattmills.com/images/#{args.image_dir}/#{file}' />"}
  date = Time.now.strftime('%Y-%m-%d')
  slug = args.post_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  
  sh "touch _posts/#{date}-#{slug}.textile"
  file = File.open("_posts/#{date}-#{slug}.textile", "w")
  file.puts <<-eom
---
layout: post
title: #{args.post_name}
date: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}
---

<div class="center">
  #{images.join("\n  ")}
</div>
eom

  sh "scp -r /Users/#{ENV['USER']}/Desktop/#{args.image_dir} matt@notuntitled.com:~/public_html/images"

end