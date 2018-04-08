# The open method returns a new File object. (It actually calls File.new for you, and returns the result of that.)
file = File.open('Support Files/test.txt')

all_lines = file.readlines

line_count = 1

all_lines.each do |line|
  puts "#{line_count} : #{line}"
  line_count += 1
end

# closing file -  If you’re writing to a file, no other program can see the changes you made until you close the file. It is very important not to forget.
file.close

line_count = 1
lines = []

# Auto closing file when opening file within a block
# Ruby offers a way to open a file, do whatever you need with it, and automatically close it again when you’re done with it. The secret is to call File.open...with a block!
File.open('Support Files/test.txt') do |file|   # file object is passed as a parameter to block

  lines = file.readlines

  lines.each do |line|
    puts "#{line_count} : #{line}"
    line_count += 1
  end

end     # !!! when block finishes, file is automatically closed

p lines

# Onenote: How can File.open work both with a block and without one?

# find_all method: The find_all method uses a block to run a test against each element in an array. It returns a new array that contains only the elements for which the test returned a true value.
relevant_lines = lines.find_all {|line| line.include?('a')} # The value of the last expression in a block gets returned to the method.
# reject method does not store values for which test returns true into the returned array

p 'relevant_lines = ', relevant_lines

# TOPIC : block return values
# take a look at block above in which include? method is called: The find_all method uses a block to run a test against each element in an array.
# It returns a new array that contains only the elements for which the test returned a true value.
# !!! Ruby blocks return the value of the last expression they contain! It’s returned to the method as the result of the yield keyword. !!!

# Onenote : Using return in a block & various methods (used with blocks) which make processing an array easy

# take a look at Hashes_references.rb