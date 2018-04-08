# Ruby offers us modules as a way to group related methods. A module starts with the keyword module and the
# module name (which must be capitalized) and ends with the keyword end. In between, in the module body, you can declare one or more methods.

module Dog

  def bark
    puts 'bark from Dog module'
  end

  def hungry
    puts 'feed me food'
  end
end

#  a class is actually a kind of module. There’s a key difference, though. You can create instances of a class,
# but you can’t create instances of a module.

# !!! you can declare a class and then “mix in” a module. When you do so, the class gains all the module’s methods as instance methods !!!
# Modules that are designed to be mixed into classes are often referred to as mixins. A mixin can be mixed into any number of classes:
# any number of modules can be mixed into a single class
class MyClass
  include Dog  # all methods in module Dog become an instance method of MyClass

  def bark
    puts 'bark from MyClass'
  end
end

myClass = MyClass.new

myClass.bark    # MyClass's bark method will be called
myClass.hungry

# TOPIC : modules and inheritance

module Dog2
  def bark
    puts 'bark from Dog2 module'
  end
end

class SubClass < MyClass
    include Dog2
end

subClass = SubClass.new
subClass.bark

# method lookup order :
#1. look for method in current class
#2. look for method in current class's imported module (if any)
#3. look for method in super class
#4. look for method in super class's imported module (if any)

=begin

Q: You said that you can’t create instances of a module. So how can a module have instance variables?

Methods from a module that refer to an instance variable get mixed into a class as instance methods. It’s only when those instance
methods are called on an object that the instance variables are created—on that object. The instance variables don’t belong to the
module at all; they belong to the instances of the classes that mix the module in.

Note:  Don't define an initialize method in a Module. If a Class in which such a module is included and if the class itself defines a
initialize method as well, then the module's initialize method will be overridden and it will never be called.
Only class's initialize will be called
=end

# Onenote : conditional assignment operator

# TOPIC: Constants
# Ruby offers the constant: a reference to an object that never changes.If you assign a value to a name that begins with a capital letter,
# Ruby will treat it as a constant rather than a variable. By convention, constant names should be ALL_CAPS. You can assign a value to a
# constant within a class or module body, and then access that constant from anywhere within that class or module.

=begin

TOPIC: Spaceship operator

Many Rubyists call < => the “spaceship operator,” because it looks like a spaceship.You can think of < => as a combination of
the <, ==, and > operators. It returns -1 if the expression on the left is less than the expression on the right, 0 if the expressions
are equal, and 1 if the expression on the left is greater than the expression on the right.

=end

puts 3 <=> 3  # returns 0
puts 5 <=> 3  # returns 1
puts 3 <=> 5  # returns -1

=begin

TOPIC: Mixins built into Ruby Core Library

The Ruby core library includes two mixins that will blow your mind. The first, Comparable, is used for comparing objects.
You’ve used operators like <, >, and == on numbers and strings, but Comparable will let you use them on your classes.

The second mixin, Enumerable, is used for working with collections. Remember those super-useful find_all, reject, and map
methods that you used on arrays before? Those came from Enumerable. But that’s a tiny fraction of what Enumerable can do.
And again, you can mix it into your classes. Read on to see how!

=end

# comparable module contains 6 methods: >, >=, <, <=, == and between?
# The <, < =, ==, >=, and between? methods work similarly, relying on the < => method to determine whether to return true or false.
# Implement the < => method and mix in Comparable, and you get the <, < =, ==, >, >=, and between? methods for free!
# The <, < =, ==, >=, and between? methods work similarly, relying on the < => method to determine whether to return true or false.

class Grade

  include Comparable

  # ruby constant below
  GRADE = {:A => 4, :B => 3, :C => 2, :D => 1, :F => 0}

  attr_accessor :grade

  def <=> (other)
    if GRADE[self.grade] > GRADE[other.grade]
      return 1
    elsif GRADE[self.grade] < GRADE[other.grade]
      return -1
    end
    0
  end

end

grade1 = Grade.new
grade1.grade = :A
grade2 = Grade.new
grade2.grade = :F

puts grade1 < grade2
puts grade1 > grade2
puts grade1 == grade2

=begin

TOPIC: Enumerable module

Mixing the Enumerable module into a class adds methods for working with collections.
many of Ruby’s collection classes (like Array and Hash) mix in the Enumerable module to implement their methods that work with collections.

Enumerable module contain a total of 48 methods.
Onenote: methods in Enumerable module

The methods in Enumerable will call on your each method to loop through the items in your class, and perform whatever operation you need on them.

=end

class GradeCollection

  include Enumerable

  GRADE_BOOK = ['kar has a', 'kate has b', 'cat has c']

  # each method called by 48 other methods in Enumerable module
  def each
    GRADE_BOOK.each {|eachElement| yield eachElement}
  end

end

puts GradeCollection.new.first
puts GradeCollection.new.map {|each| each.reverse}

