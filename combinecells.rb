#!/usr/bin/env ruby

# Number of rows, Column to merge with

startrow = 6
lastrow =7

sheets = {"Creation"=>["B", "C"], 
          "Password"=>["B", "C", "D"],
          "Access" => ["B"],
          "Federation" => ["B"]}
          
          
sheets.each do |sheet, cols|
 # puts "#{sheet} UCs"

  # (1..ARGV[0].to_i).each do |i|
    cols.each do |col|
      (startrow..lastrow).each do |i|
    
      puts "=$A$#{i}"
      puts "='#{sheet} UCs'!" + col +"#{i}"
    end
  end
end
  



