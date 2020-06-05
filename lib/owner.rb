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
    self.all.clear #Accessing class varible directly?
    
  end

  def cats

    Cat.all.select do |kat|
      kat.owner == self
    end
  end
  
  def dogs

    Dog.all.select do |dok|
      dok.owner == self
    end
  end

  def buy_cat(new_cat)
   Cat.new(new_cat, self)

  end

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end


end