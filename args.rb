puts "Program with #{ARGV.size} arguments."
puts ""
if ARGV.size == 0
  puts "Try running these commands to explore how command-line arguments work:"
  puts ""
  puts "    ruby args.rb apple"
  puts "    ruby args.rb dog cat"
  puts "    ruby args.rb -f how-does-this-work.txt"
  puts "    ruby args.rb 5 4 3 2 1 blastoff"
else
  ARGV.each_with_index do |argument, i|
    puts "ARGV[#{i}] is the string '#{argument}'"
  end
end
puts ""
puts "This is a demonstration of how command-line arguments work in Ruby."
# https://github.com/xynnylol