class Museum
attr_accessor :tilte, :description, :image_url
@@all = []

def initialize(description)
  @description = description
  @image_url = []
end

def self.all
  @@all
end

def save
  @@all << self
  end
end
