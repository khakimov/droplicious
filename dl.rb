#!/usr/bin/ruby

require 'uri'
require 'yaml'

# todo:
# [done] 0. checking file and if it doesn't exist - create it.
# [done] 1. help with small description what is this and how it works
# 2. figure out about idea to open link at current browser. like $ bus ruby => got 4 links, then type bus ruby 3 and it will open in browser this link
# 3. refactoring

def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end

def bookmark_processing
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
  result.to_yaml
end

# will be better to have only one method which works with file, a?
def save_bookmark(data)
  t = open(File.expand_path("~/Dropbox/test.txt"), "a")
  t.write(data)
  puts "saved"
  t.close
end

# how to make it better? the main idea of this method is checking the file and 
# if it exists return the pointer. if not - create and return the pointer.
def load_bookmarks
  if File.exist? File.expand_path("~/Dropbox/test.txt")
    return YAML.load_stream(open(File.expand_path("~/Dropbox/test.txt"))).documents 
  else
    puts "Add: ./dl.rb url"
    puts "Get: ./dl.rb tagname"
    return open(File.expand_path("~/Dropbox/test.txt"), "w")
  end
end

def p_bookmark(bookmark)
  puts "#{bookmark['date']} #{green(bookmark['url'])} #{red(bookmark['description'])} #{bookmark['tags']}"
end

if (ARGV[0] =~ URI::regexp).nil?
  bookmarks = load_bookmarks
  if bookmarks
    if ARGV[0].nil?
      size = 10
      size = bookmarks.count if bookmarks.count < 10
      bookmarks[-(size)..-1].each { |bookmark|
        p_bookmark(bookmark)
      }
    else
      bookmarks.each { |bookmark|
        bookmark['tags'].each { |tag| p_bookmark(bookmark) if tag =~ /#{ARGV[0]}/ }
      }
    end
  end
else
  save_bookmark(bookmark_processing)
end
