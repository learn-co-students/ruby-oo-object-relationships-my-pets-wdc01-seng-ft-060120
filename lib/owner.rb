require 'pry'
class Owner
  attr_reader :name, :species
  attr_writer :cats
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    return self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
      Cat.all.select do |kitty|
        self == kitty.owner
      end
      # binding.pry
  end

  def dogs
    Dog.all.select do |dog|
      self == dog.owner
    end
    # binding.pry
  end

  def buy_cat(cat)
    Cat.new(cat,self)    
  end
  
  def buy_dog(dog)
    Dog.new(dog,self)
  end

  def walk_dogs
    make_happy(self.dogs)
  end
  
  def feed_cats
    make_happy(self.cats)
  end

  def sell_pets
    [self.cats,self.dogs].each do |animals|
        animals.each do |animal|
          animal.mood = "nervous"
          animal.owner = nil
        end
    end
  end  

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  private
  def make_happy(array)
    array.each do |animal|
      animal.mood = "happy"
    end
  end
end