# Bike

require 'forwardable'

class Bike
  extend Forwardable

  STANDARD_WEIGHT = 200 # lbs

  attr_accessor :id, :color, :price, :weight, :rented
  def_delegators :@cargo, :add_cargo, :remove_cargo, :pannier_capacity, :pannier_remaining_capacity

  def initialize(id, color, price, weight = STANDARD_WEIGHT, rented = false)
    @id = id
    @color = color
    @price = price
    @weight = weight
    @rented = rented
    @cargo = Cargo.new
  end

  def rent!
    self.rented = true
  end

end



class Cargo

  MAX_CARGO_ITEMS = 10
  attr_accessor :cargo_contents

  def initialize
    @cargo_contents = []
  end

    def add_cargo(item)
    if MAX_CARGO_ITEMS > self.cargo_contents.size
      self.cargo_contents << item
    else
      puts("Cargo Capacity Filled!")
    end
  end

  def remove_cargo(item)
    self.cargo_contents.delete(item)
  end

  def pannier_capacity
    MAX_CARGO_ITEMS
  end

  def pannier_remaining_capacity
    MAX_CARGO_ITEMS - self.cargo_contents.size
  end

end
