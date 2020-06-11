require 'pry'
class Owner
  attr_reader :name, :species
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

  def buy_cat(name)
    #create an instance of cat
    name = Cat.new(name,self)
    #push to the Cat.all
  end

  def buy_dog(name)
    name = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each {|cat| cat.mood = "nervous"}
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|kat| kat.owner = nil}
    self.dogs.each {|dog| dog.owner = nil}
  end
  
  def list_pets
    self.buy_cat("bob")
    self.buy_cat("tom")
    self.buy_dog("ben")
    self.buy_dog("ket")
     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end