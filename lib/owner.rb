class Owner
  attr_writer
  attr_reader :name, :species
  attr_accessor 
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end 

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |canine|
      canine.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |feline|
      feline.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |canine|
      canine.mood = "nervous"
      canine.owner = nil
    end
    self.cats.each do |feline|
      feline.mood = "nervous"
      feline.owner = nil
    end
  end

  def list_pets
     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end