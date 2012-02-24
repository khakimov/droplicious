#!/usr/bin/ruby

require 'uri'
require 'yaml'

# todo:
# 0. checking file and if it doesn't exist - create it.
# 1. help with small description what is this and how it works
# 2. figure out about idea to open link at current browser. like $ bus ruby => got 4 links, then type bus ruby 3 and it will open in browser this link
# 3. refactoring

def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end

def bookmark_file
  if File.exist? File.expand_path("~/Dropbox/test.txt")
    return open(File.expand_path("~/Dropbox/test.txt"))
  else
    return open(File.expand_path("~/Dropbox/test.txt"), "w")
  end
end

def write_to_file(data)
  t = open(File.expand_path("~/Dropbox/test.txt"), "a")
  t.write(data)
end

def p_bookmark(bookmark)
  puts "#{bookmark['date']} #{green(bookmark['url'])} #{red(bookmark['description'])} #{bookmark['tags']}"
end

if (ARGV[0] =~ URI::regexp).nil?
  docs = YAML.load_stream(bookmark_file).documents if YAML.load_stream(bookmark_file)
  if docs
    if ARGV[0].nil?
      size = 10
      size = docs.count if docs.count < 10
      docs[-(size)..-1].each { |doc|
        p_bookmark(doc)
      }
    else
      docs.each { |doc|
        doc['tags'].each { |tag| p_bookmark(doc) if tag =~ /#{ARGV[0]}/ }
        #p_bookmark(doc) if doc.values.grep(/#{ARGV[0]}/).count > 0
      }
    end
  end
else
  print "desc? "
  description = STDIN.gets.chomp
  print "tags (example: ruby, programming, book)? "
  tags = STDIN.gets.chomp.split(",")
  tags.collect!{|x| x.strip}
  date = Time.now.asctime
  result = { "date" => date,
             "url" => ARGV[0],
             "description" => description,
             "tags" => tags
            }
  write_to_file(result.to_yaml)
end
