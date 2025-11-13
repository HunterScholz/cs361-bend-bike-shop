class Rental

  attr_reader :bike

  def initialize(bike, luggage)
    @bike = bike
    @luggage = luggage
  end

  # Price should now be the base price of the bike, plus $2 times its weight, plus $2 times the weight of any luggage

  def price
    @bike.price + self.weight * 2
  end

  def weight
    @bike.weight + @luggage.item_count
  end

end
