puts __FILE__
puts $PROGRAM_NAME

if __FILE__ == $PROGRAM_NAME
  puts File.readlines(ARGV.shift)
else
  x = gets.chomp
  puts x
end

