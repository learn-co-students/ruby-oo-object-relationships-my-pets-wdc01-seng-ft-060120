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

    #push to the Cat.all


  end
end