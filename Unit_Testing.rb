# An automated test is a separate program that executes components of your main program, and verifies they behave as expected.
# Use automated testing to make sure that old features of program are not broken on making change to existing program

# The Ruby standard library includes a unit-testing framework called MiniTest. Its behavior is very simple: if you pass it a true value,
# it passes, but if you pass it a false value, the whole test fails and stops immediately.
require 'minitest/autorun'

# assert method: Its behavior is very simple: if you pass it a true value, it passes, but if you pass it a false value, the whole
# test fails and stops immediately.

# We create a new subclass of the Minitest::Test class, named whatever we want. Subclasses of Minitest::Test can be run as unit tests.
# When a test runs, MiniTest goes through the test class, finds all the instance methods whose names begin with test_, and calls them.
# (You can add methods with other names, but they won’t be treated as test methods.)
class MyTests < Minitest::Test

  attr_accessor :calculator

  def test_true_assertion
    assert(true)    # this will pass
    assert_includes(['apple', 'mango'], 'apple')    # this will pass as apple is included in array
    assert_instance_of(String, 'apple')    # this will pass as apple is an instance of String

    #assert_raises takes 1 or more exception classes as arguments as well as a block. IF block does not raise an exception that matches one
    # of the specified classes, it fails.
    assert_raises(ZeroDivisionError) do
      raise ZeroDivisionError, 'can\'t divide by 0'
    end
  end

  def test_false_assertion
    assert(false, 'comment to describe failure')   # this will fail
  end

  def test_calculator_addition

    @calculator = Calculator.new

    # There’s also the assert_equal method, which takes two arguments and checks that they are equal. If they’re not, the test will fail,
    # just as with assert. But more importantly, it will print the expected value and the actual value in the test summary,
    # so that we can compare them easily.

    # The first argument to assert_equal should be the value we expect, and the second argument should be the value our code actually returns.
    assert_equal(@calculator.add(5, 9), 14)
  end

end

=begin

#TOPIC : troubleshooting potential errors

Q: I got an “uninitialized constant MiniTest::Test” error!
A:You might have an older version of MiniTest installed. Try running “gem install minitest” from a command line.

Q: I got an “cannot load such file -- minitest/autorun” error!
A: Running “gem install minitest” should fix that as well.

=end

# Onenote: Unit testing

# The code never calls TestPerson.new or any of the test methods. How do the tests run by themselves?
# A: When we require 'minitest/autorun', it sets up the test classes to run as soon as they load, automatically.

class Calculator

  attr_accessor :arg1, :arg2

  def initialize
    arg1 = 0
    arg2 = 0
  end

  def add(arg1, arg2)
    arg1 + arg2
  end

  def subtract(arg1, arg2)
    arg1 - arg2
  end
end