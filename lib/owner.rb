require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end
  
  def cats
    Cat.all.select {|c| c.owner == self}
  end
  
  def dogs
    Dog.all.select {|d| d.owner == self}
  end
  
  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end
  
  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
  end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
# binding.pry