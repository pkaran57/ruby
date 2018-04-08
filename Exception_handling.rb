# raise method halts program execution with an error message when an error is encountered

class Dog

  attr_reader :name

  def name=(name)

    unless name && name != ''

      # The raise method is actually creating an exception object, an object that represents an error.
      # If they’re not dealt with, exceptions will stop your program cold.
      raise 'Name can\'t be blank'
    end
    @name = name
  end

end

dog = Dog.new
dog.name = "as"
puts dog.name

# If you have some code that you think might raise exceptions, you can surround it in a begin/end block, and add one or more rescue
# clauses that will run when an exception is encountered. A rescue clause may contain code to write an error message to a logfile,
# reattempt a network connection, or do whatever is needed to deal gracefully with the problem.

#Once the rescue clause finishes, code execution will continue normally following the begin/end block. Since you presumably handled
# the problem in the rescue clause, there’s no need for your program to end.
begin
  a = 0 / 0
  puts 'this will NOT get printed'
rescue
  puts 'rescued'
end

# Order in which ruby searches for a rescue in case an exception is thrown:
# 1. search for rescue within the method raising an exception. If no rescue in method found, method immediately exits without returning anything
# 2. When the method exits, Ruby will also look for a rescue clause in the place the method was called. So if you’re calling a method that
#    you think might throw an exception, you can surround the call with a begin/end block
# 3. This can continue through multiple methods. If the method’s caller doesn’t have an appropriate rescue clause, Ruby will exit that
#    method immediately, and look for a rescue clause in its caller. This continues through the chain of calls until an appropriate rescue
#    clause is found. (If none is ever found, the program halts.)

# TOPIC: raising an exception with exception's message attribute set

begin

  raise 'raising an exception with exception\'s message attribute set' # # if an exception class is not defined, RunTimeError is raised by default

rescue => exception   # storing the caught exception object into exception variable
  puts exception.message
end

# TOPIC: Exception classes

# raise 'oops'  # By default, raise creates an instance of the RuntimeError class.

a = 3
b = 0

if b == 0
  # raise ZeroDivisionError, 'Can\'t divide by 0'
end

# Onenote: Exception class hierarchy

class MyError < StandardError
end

class MyError2 < MyError
end

begin
  raise MyError2, 'this is my error'

rescue MyError => error   # only errors of class MyError or any of its subclasses will be caught
  puts error.message
end

# Now that we can create our own exception classes, we need to be able to rescue the right classes. You can include a class name right
# after the rescue keyword in a rescue clause, to specify that it should rescue only exceptions that are instances of that class
# (or one of its subclasses)

begin
  10 / 0

rescue StandardError => error         # first matching rescue gets executed
  puts 'this is a standard error'
rescue ZeroDivisionError => error
  puts 'zero division error'

end

value1 = 9
value2 = 0

begin
  puts value1 / value2

rescue
  value2 = 9
  retry # When you include retry in a rescue clause, execution returns to the start of the begin/end block, and statements there get rerun
        # watch out for infinite loops in case of using a retry statement. EX: setting value2 to 0 will create an infinite loop

ensure

  # If you have some code that you need to run regardless of whether there’s an exception, you can put it in an ensure clause.
  # The ensure clause should appear in a begin/end block, after all the rescue clauses. Any statements between the ensure and
  # end keywords are guaranteed to be run before the block exits.
  puts 'this will run regardless of exception being raised or not'
end

begin

  raise Exception, 'this is a security error which is a subclass of Exception class (not a subclass of Standard Error)'

rescue => error

  puts 'only Exceptions of class Standard error or any of its subclasses are caught by default'
end