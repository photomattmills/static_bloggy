task :new_post, [:post_name] do |t, args|
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
  
</div>
eom

end