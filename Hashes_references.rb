# What if there were a kind of collection where all the data had labels on it? You could quickly find the elements you needed!  Ruby hashes, which do just that.

# A hash is a collection where each value is accessed via a key. Keys are an easy way to get data back out of your hash
elements = {'H' => 'Hydrogen', 'Li' => 'Lithium'}   # here, H is key to the value Hydrogen

puts elements['H']

# adding key value pair to an existing hash
elements['Ne'] = 'Neon'

p elements

# Whereas an array can only use integers as indexes, a hash can use any object as a key. That includes numbers, strings, and symbols.
hash_table = {1 => 'one', 2 => 'two', :three => 3.0}

puts hash_table[:three]

# hashes are objects too
puts hash_table.class

# Onenote: Useful hash methods

p hash_table
hash_table = hash_table.merge({:three => 3, 'four' => 4})   # values for existing keys are updated and new keys are added
p hash_table
hash_table['four'] = 4.0  # existing keys are updated
p hash_table

# nil returned if a key does not exist
p hash_table['this_key_does_not_exist']

# when you call Hash.new and pass an object as an argument, that argument becomes that hash’s default object. Any time you access a key in
# that hash that hasn’t been assigned to yet, instead of nil, you’ll get the default object you specified.
other_hash = Hash.new(99)   # 99 is returned instead of nil if 99 is not a key    # !!! make sure that default hash value does not cause any bugs !!!

p other_hash[23]

# using each with hash
hash_table.each { |key, value| puts "key : #{key}, value : #{value}" }    # two args : key and value are passed onto code block

=begin
Q: What happens if I call each on a hash, but pass it a block with one parameter?

A: The each method for hashes allows that; it will pass the block a two-element array with the key and value from each key/value pair in the hash. It’s much more common to use blocks with two parameters, though.
=end

# Onenote : Using hash as parameters to a method
# Onenote : keyword arguments   [use keyword arguments over hash parameters]
# Onenote : References / Hash default blocks

# in ruby, return expression of an assignment expression is the assigned value
p other_hash['lol'] = 'lolz'

# take a look at Modules.rb