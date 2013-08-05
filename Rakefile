task :new_post, [:post_name, :image_dir] do |t, args|
    img_dir = "/Users/#{ENV['USER']}/Desktop/#{args.image_dir}"  #set this so it's easy to grab later
    files = Dir.entries(img_dir).select { |filename|  !File.directory?("#{img_dir}/#{filename}") }  # ALL THE FILENAMES
    images = files.map {|file| "<img src='http://photomattmills.com/images/#{args.image_dir}/#{file}' />"} #in an array of strings as img tags
  time = Time.now
  date = time.strftime('%Y-%m-%d')  
  slug = args.post_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') #slug the title, to make a filemanmt
  
  file = File.open("_posts/#{date}-#{slug}.textile", "w")
  file.puts <<-eom
---
layout: post
title: #{args.post_name}
date: #{time.strftime('%Y-%m-%d %H:%M:%S %z')}
---

<div class="center">
  #{images.join("\n  ") if images}
</div>
eom
  file.close

  sh "scp -r /Users/#{ENV['USER']}/Desktop/#{args.image_dir} matt@notuntitled.com:~/public_html/images" if images

end
