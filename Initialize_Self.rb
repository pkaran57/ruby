# When you call MyClass.new, Ruby allocates some memory to hold a new MyClass object, then calls the initialize instance method on that new object.
# Ruby calls the initialize method on new objects after they’re created.

class Test

  attr_accessor :num1, :num2
  attr_reader :met_name

  # initialize is an ordinary instance method which gets called before any other instance method
  # initialize cannot be called from outside. It is implicitly called when .new is used to create a new object
  # initialize method is always called after call to/use of .new
  # The object class has an initialize method which does not set any variables. It can however be overridden
  def initialize(name = 'default_name')
    @num1 = 5.0     # NOTE: Can't do this : num1 = 5.0   since num1 will be treated as a local variable. However, we can do this: self.num1 = 5.0
    @num2 = 3
    @met_name = name

    # Within instance methods, self always refers to the current object
    self.num1=(6)
  end

  def divide

    num1 = 343

    "#{met_name} says #{self.num1 / num2}"    # if self is omitted, 343 will be used for num1 instead of 5.0
  end

end

test = Test.new("lolz")
puts test.divide

test = Test.new
puts test.divide

class Test2 < Test

  attr_accessor :name2

  # if initialize is not overridden below, then the superclass's initialize method can be used since it is inherited by Test2 class

  # NOTE : initialzie method is just a normal instance method and thus superclass's initialize method is not implicitly called. Need to use super to call it
  def initialize(name = 'default_name', name2 = 'default_name')
      super('mah_name')   # calls initialize in super class, NOTE : super does not need to be first line of code. It can be called anywhere in initialize
      @name2 = 'default_name2'
  end

  # class methods: methods that you can invoke directly on a class, without the need for any instance of that class
  def Test2.class_method
    "from class_method : #{name2}"
  end

  # Within a class definition (but outside any instance method definitions), Ruby sets self to refer to the class that’s being defined.
  def self.class_method2
    'from class_method2'
  end

end

puts Test2.new.divide
puts Test2.new.name2

puts Test2.class_method
puts Test2.class_method2

# take a look at Arrays_blocks.rb