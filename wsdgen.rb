#! /usr/bin/env ruby
require 'net/http'
require 'uri'
require 'open-uri'

if ARGV[0] && $stdout.tty?
  if File.exist?(ARGV[0])
    text = File.read(ARGV[0])
  else
    text = open(ARGV[0], 'Accept' => 'text/plain').read
  end
else
  text = readlines.join
end

response = Net::HTTP.post_form(URI.parse('http://www.websequencediagrams.com/index.php'), 'style' => 'default', 'message' => text)

if response.body =~ /img: "(.+)"/
  url = "http://www.websequencediagrams.com/#{ $1 }"
  url.match(/img=(.+)$/)
  file = "#{ $1 }.png"

  $stderr.puts "Opening #{ url }"
  File.open(file, "w+") { |f| f << open(url).read }

  case RUBY_PLATFORM
  when /linux/i
    $stderr.puts "Running gnome-open file:///#{ Dir.getwd }/#{ file }"
    system("gnome-open file://#{ Dir.getwd }/#{ file }")
  else
    system("open #{ file }")
  end
end




