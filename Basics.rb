# TOPIC: puts, print, gets

# The puts and print methods automatically call to_s on an object to convert it to a string for printing.

# puts method (“puts” is short for “put string”) displays text on standard output (usually the terminal)
# puts adds a newline character at the end of the string (if it doesn’t already have one)
puts "new line char implicitly attached to end of string when using string with puts\n\n"

puts 'line one', 'line two'   # each printed on new line
puts('line 1', 'line 2')  # Parentheses are optional on method calls

#  print method does not add a new line char at end of string
print "Welcome 'User'"
print ' ! What is your name : '

# The gets method (short for “get string”) reads a line from standard input (characters typed in the terminal window). When you call gets, it causes
# the program to halt until the user types their name and presses the Enter key. It returns the user’s text to the program as another string.
input = gets

# NOTE : There’s a newline at the end of the user input because when the user hits the entry key to indicate their entry is done, that gets recorded as an
# extra character. That newline is then included in the return value of the gets method.

# TOPIC: Multiline comment

=begin

Convention of Ruby : leave parentheses off of a method call if there are no arguments (example: call to gets above). You can leave them off for method calls where
there are arguments as well (example: second use of puts above), but this can make some code more difficult to read. When in doubt, use parentheses!

=end

# TOPIC: String interpolation (substitution)

# Ruby applies interpolation only in double-quoted strings. If you include a #{...} marker in a single-quoted string, it will be taken literally.

puts "6 * 7 = #{6 * 7}"   # any ruby expression can be used within a #{...}
puts "Welcome #{input} !" # *** NOTE : ! in string will be printed on next line ***

puts "Welcome #{input.chomp} !"     # If the last character of a string is a newline, the chomp method will remove it. It’s great for things like cleaning up strings
                                    # returned from gets.

# TOPIC: Inspecting objects with the “inspect” and “p” methods

=begin
The inspect method is available on any Ruby object. It converts the object to a string representation that’s suitable for debugging. That is, it will reveal
information about an object that doesn’t normally show up in program output.
=end
puts input.inspect

# Printing the result of inspect is so common that Ruby offers another shortcut: the p method. It works just like puts, except that it calls inspect on each
# argument before printing it
p input

# TOPIC: Escape sequence

puts "Line1\nLine2\nLine3"      # \n
puts "\tindented line"          # \t
puts "\"Its okay\", he said."   # \"
puts "one back slash : \\"      # \\

# NOTE: Bear in mind that most of these escape sequences apply only in double-quoted strings. In single-quoted strings, most escape sequences are treated literally.

# TOPIC: Some useful methods

# methods method print out a long list of all methods and operators which can be called on / used with 42 (an integer object).
# Since list is too long, line in commented out
# puts 42.methods

# class method prints out class of object on which class method is called on
puts 42.class
puts true.class
puts 'hello'.class

# rand generates numbers between zero and just below the maximum value you specify.
# That means we’ll be getting random numbers in the range 0–99, not 1–100 like we need.
puts "Random number between 0 to 99 is #{rand(100)}"

# almost all Ruby objects have a to_s, to_i and to_f method which converts object to string, integer and float representation
puts 42.to_s + ' is a number'
puts "#{'49'.to_i + 1} = 50"
puts "#{'49.34'.to_f + 1} = 50.34"

# now, take a look at Control_flow.rb