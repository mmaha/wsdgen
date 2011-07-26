#!/usr/bin/env ruby

ARGF.each do |line|
    puts ARGF.pos.to_s + "; " + line.length.to_s + "; " + line  if line =~ /participant User/
end

