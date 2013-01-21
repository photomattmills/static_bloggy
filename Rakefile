class Dir
  def map(&block) #this will do all the contents of a file, be sure you're remembering about . and .. and all those dotfiles...
    output = []
    self.each do |entry|
      output << block.call(entry)
    end
    return output
  end
end


def number(n)
  return "000#{n}" if n < 10
  return "00#{n}"  if n < 100
  return "0#{n}"   if n < 1000
  return "#{n}"
end

task :new_post, [:post_name, :image_dir] do |t, args|
  puts ENV['USER']
  #range = args.image_numbers.split("-").map {|s| s.to_i}
  dir = Dir.new "/Users/#{ENV['USER']}/Desktop/#{args.image_dir}"
  files = dir.map {|filename| filename unless File.directory?("/Users/#{ENV['USER']}/Desktop/#{args.image_dir}/#{filename}")}.compact!
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

end