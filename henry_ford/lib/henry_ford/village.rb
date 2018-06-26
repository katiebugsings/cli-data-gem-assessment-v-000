class Village

  attr_accessor :description, :restaurants

  def initialize(description)
    self.restaurants = []
    @description = description
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
