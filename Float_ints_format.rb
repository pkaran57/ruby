# numbers are represented using Integer (also know as Fixnum) or Float class

# Ruby rounds fractional numbers down to the nearest whole number.
puts 5 / 2

puts 5.class

# Any number in your code that does have a decimal point in it gets treated as a Float
puts 5.0.class

# Ruby will give you a Float back as long as either operand is a Float
puts 5 / 2.0

=begin

# TOPIC : Formatting numeric output

The first argument to format is a string that will be used to format the output. Most of it is formatted exactly as it appears in the string. Any percent signs (%), however, will be treated
as the start of a format sequence, a section of the string that will be substituted with a value in a particular format. The remaining arguments are used as values for those format sequences.

=end

puts format('rounded division : %0.4f', 3.141232323)    # %0.4f is format sequence

# OneNote : Formatting numbers for printing

# take a look at Initialize_Self.rb