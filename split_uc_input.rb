#!/usr/bin/env ruby

ARGF.each do |line|
    puts line if line =~ /participant User/
end

