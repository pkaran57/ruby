# Methods that are defined outside of any class (like examples below) are included in the top-level execution environment

def print_stuff
  puts 'from print_stuff'
end

# if there are parameters, you should always include parentheses. Leaving them off is legal, but again, don’t do it.
def add(a,b)

  # result of expression in last line is automatically stored as a return value, mentioning return is optional in this case
  a + b
end

def divide(a, b)

  if b==0
    return 'cannot divide by 0'    # need to use an explicit return in this case to exit from method
  end

  a/b
end

# optional parameters need to appear after any other parameters you intend to use
def print_2(to_print = 'this is an optional parameter')
  puts "from print_2 : #{to_print}"
end

# method calls
print_stuff
print_2
print_2("lol")
puts divide(0, 0)
puts divide(12, 2)

=begin
# TOPIC : Methods ending in ? or !

It’s also legal for a method name to end in a question mark (?) or exclamation point (!). These endings have no special meaning to Ruby.
But by convention, methods that return a Boolean (true/false) value are given names that end in ?, and methods that have potentially
surprising side effects are given names that end in !.
=end

def isEven?(num)
  num % 2 == 0
end

puts isEven?(43)

# take a look at Class.rb