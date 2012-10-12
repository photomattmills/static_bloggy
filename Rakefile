def number(n)
  return "000#{n}" if n < 10
  return "00#{n}"  if n < 100
  return "0#{n}"   if n < 1000
  return "#{n}"
end

task :new_post, [:post_name, :image_numbers, :image_dir] do |t, args|

  range = args.image_numbers.split("-").map {|s| s.to_i}
  images = (range[0]..range[1]).map {|n| "<img src='http://photomattmills.com/images/#{args.image_dir}/#{number(n)}.jpg' />"}
  
  
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

end