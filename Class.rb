
class Car

  # instance variables start with a @ and are kept around as long as the object is
  # NOTE : method below needs to be called at least once before instance variable @car_name can be initialized
  def assign_car_name
    @car_name = 'WhatEver'  # Instance variables are encapsulated. i.e. they cant be accessed outside class
  end

  # instance method
  def car_description

    # car_make is a local variable (it lives until the method ends)
    car_make = 'Toyota'

    puts "This is a #{@car_year.inspect} #{car_make} #{@model.inspect}. It is called #{@car_name.inspect} by its owner. Its owner's name is #{owner.inspect}."
  end

  # attribute writer method (setter), note the = at the end of the method name
  def car_year=(year)
    @car_year = year
  end

  # attribute reader method (getter)
  def car_year
    @car_year
  end

  # the syntax below implicitly creates a getter and setter for model and owner instance variables
  attr_accessor :model, :owner

=begin

   # TOPIC: attribute readers and writers

     use attr_writer to create only setters. Example:
     attr_writer :name

    use attr_reader to create only getters. Example:
     attr_reader :name

    use attr_accessor to create both setter and getters
=end

end

my_car = Car.new

# TOPIC : nil
# Ruby has a special value, nil, that represents nothing. That is, it represents the absence of a value.
# nil is an object of NilClass class. NilClass's to_s method returns an empty string
# !!! all instance variables have a value of nil when an instance of a class is first created !!!
my_car.car_description

my_car.assign_car_name  # need to be called so that @car_name gets initialized. If not called, an empty string is returned whenever @car_name's value is accessed

my_car.car_year = 1990  # @car_year needs to be initialized before use. Calling getter like this is equivalent to the below statement (ruby interpreter translates this statement to the one below)
my_car.car_year=(1989)  # alternative way of calling setter

my_car.owner = 'Bill Gates'
my_car.model = 'Camry'

my_car.car_description

# OneNote: Instance variable outside an instance method

# All Ruby objects have a method called instance_variables that we can call to see what instance variables are defined for that object.
puts "\nAll instance variables of my_car object:", my_car.instance_variables

# take a look at Inheritance.rb