# An array is used to hold a collection of objects. The collection can be any size you need. An array can hold objects
# of any type (even other arrays). You can even mix multiple types together in the same array.

array = [2.99, 25, 9.99, 'string', nil]

p array
puts array.inspect # same as p array

puts array[4]
array[4] = 'modified'
puts array[4]

# nil is returned if index is accessed outside array's range
puts array[88].inspect

# arrays are objects
puts "Arrays are of class #{array.class}"

# common array methods
puts array.inspect
puts "Common array methods, array.length = #{array.length} , array.last.inspect = #{array.last.inspect}, array.include?(454) = #{array.include?(454)}"
puts "array.find_index(23) = #{array.find_index(23).inspect}"

# OneNote: Common array methods

# array to string conversion
puts ["d", "o", "g"].join
puts ["d", "o", "g"].join("-")

# TOPIC : Ruby blocks
puts "************** Ruby blocks ******************\n\n"

# A block is a chunk of code that you associate with a method call. While the method runs, it can invoke (execute) the block one or more times. Methods and blocks work in tandem to process your data.

# If you place an ampersand before the last parameter in a method definition, Ruby will expect a block to be attached to any call to that method. It will take the block, convert it to an object, and store it in that parameter.
def my_method(&my_block)
  puts 'from my_method : before calling call method on my_block'
  my_block.call   # call method calls the block
  puts 'from my_method : after calling call method on my_block'
  my_block.call
end

#my_method    # this line will create an error since my_block will be nil since no block has been associated with the method

# a block is defined below. "do" marks beginning of block and "end" marks end of block. block is stored in my_block parameter of my_method
# When calling a method, you can provide a block. The method can then invoke the code in that block.
# Can a method take more than one block at the same time? - NO
my_method do
  puts 'we are in a block'
end

def my_puts(&block)
  block.call('test', 'your', 'best', 'trest')

  # yield keyword: The yield keyword will find and invoke the block a method was called with—there’s no need to declare a parameter to accept the block.
  yield 'test', 'your', 'best', 'trest'
end

my_puts do |arg1, arg2|
  puts "\nfrom block do end :", arg1, arg2
end

# braces can also be used to mark start and end of a block
my_puts { |arg1, arg2|
  puts "\nfrom block braces :", arg1, arg2
}

# convention: Ruby blocks that fit on a single line should be surrounded with curly braces. Blocks that span multiple lines should be surrounded with do...end.

# TOPIC : Each method and using each method with blocks

puts "\n****************** each method ******************** \n"

# Each method loops through each element of an array and passes it to a block one by one
[1, 2 ,3].each {|params| puts "from each method : #{params}"}

[1, 2, 3].each do |params|
  puts "From each : #{params}"
end

# TOPIC : multidimensional arrays

array = [
    ['test1', 1],
    ['test2', 2],
    ['test3', 3]
]

p array

# take a look at Files_block_returns.rb