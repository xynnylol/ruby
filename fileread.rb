if ARGV.size == 0
  puts "You didnt tell us what file to read.  Try this command:"
  puts ""
  puts "    ruby fileread.rb randomfile.txt"
  exit
end
file_name = ARGV[0]
file_contents = File.read(file_name)
puts "The contents of #{file_name} are:"
puts "=========="
puts file_contents
puts "=========="
puts ""
puts "The contents of #{file_name} in all uppercase are:"
puts "=========="
puts file_contents.upcase
puts "=========="
puts ""
puts "The contents of #{file_name} in reverse are:"
puts "=========="
puts file_contents.reverse
puts "=========="
# https://github.com/xynnylol