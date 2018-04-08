class Vehicle

  attr_accessor :odometer, :gas_used

  def mileage
      odometer / gas_used   # / is a method in ruby. This is same as odometer./(gas_used)
  end

  def description
    puts 'From Vehicle.description'
  end

end

# class Truck is a subclass of Vehicle superclass
class Truck < Vehicle

  attr_accessor :load_capacity

  # this method overrides the method in Vehicle class
  def description
    puts 'From Truck.description'

    # When you use the super keyword within a method, it makes a call to a method of the same name on the superclass
    super

    # Onenote : super and super()

  end

  # overriding to_s method of object class
  def to_s
    puts 'custom to_s'
  end

end

my_truck = Truck.new

# my_truck.mileage   # this call will raise an exception since odometer instance variable in mileage class will evaluate to nil (since it is not initialized). Also, nil has no / method
my_truck.to_s

my_truck.odometer = 120
my_truck.gas_used = 12

puts "my_truck has a mileage of #{my_truck.mileage}"

# OneNote: Instance variables belong to the object, not the class!

# Note: Instance variables are not inherited by a subclass. However, subclasses can inherit instance methods and !!! instance methods create instance variables !!!
# Thus, if getters and setters (which are instance methods) can be inherited, the instance variables that they create are also inherited.

my_truck.description

# take a look at Float_ints_format.rb

