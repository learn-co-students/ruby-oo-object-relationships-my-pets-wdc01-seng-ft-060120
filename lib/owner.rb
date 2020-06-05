require 'pry' 
require_relative './cat.rb'
require_relative './dog.rb'

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
    "I am a #{@species}." 
  end 

  def self.all
    @@all
  end 

  def self.count 
    @@all.length 
  end 

  def self.reset_all
    @@all.clear
  end 
############# check dogs vs. dog and cats vs. cat throughout
  def cats 
    Cat.all.select {|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end

  def buy_cat (name)
    Cat.new(name, self)
  end

  def buy_dog (name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.map do |dog|
      dog.mood = "nervous" 
      dog.owner = nil
    end
    
    cats.map do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# john = Owner.new("John")
# kitty = Cat.new("Kitty", john)
# pup = Dog.new("Pup", john)

# john.cats