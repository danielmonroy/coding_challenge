require_relative './fractions.rb'

if ARGV.size != 3
  abort "Invalid number of arguments, expected 3"
else
  puts operate_fractions(ARGV[0], ARGV[1], ARGV[2])
end
