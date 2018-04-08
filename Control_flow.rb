if true
  puts 'this will get printed'    # not indenting statements will not give an error
end

# below one same as: if ! true
if not true
  puts 'this will not get printed'
end

# opposite of if is unless
# code within an unless statement executes only if the condition is false
unless false
  puts 'this will get printed'
end

sum = 0
# while condition is true, execute statements
while sum < 2
  puts "sum from while = #{sum}"
  sum += 1
end

sum = 5
# An until loop repeats until the condition is true (that is, it loops while it’s false).
# while condition is FALSE, keep on executing statements
until sum <= 3
  puts "sum from until = #{sum}"
  sum -= 1
end

# ruby treats an expression that evaluates to false or nil as false and everything else as true
if nil
  puts 'this will not print'
end

unless nil    # nil evaluates to false
  puts 'this will be printed'
end

if 23
  puts 'this will be printed as well'
end

# now, take a look at Methods.rb