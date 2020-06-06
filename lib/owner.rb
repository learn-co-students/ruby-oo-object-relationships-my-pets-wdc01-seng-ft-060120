require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self

  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    self.all.clear 
    
  end

  def cats

    Cat.all.select do |kat|
      kat.owner == self
    end
  end
  
  def dogs

    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(new_cat)
   Cat.new(new_cat, self)

  end

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end

   def walk_dogs
    self.dogs.each {|dog| dog.mood = 'happy'} 
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = 'nervous'; dog.owner = nil}
    self.cats.each {|cat| cat.mood = 'nervous'; cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
