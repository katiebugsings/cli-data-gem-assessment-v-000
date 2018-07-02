class Village

  attr_accessor :restaurants

  def initialize(restaurants)
    self.restaurants = []
    @restaurants = restaurants
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
