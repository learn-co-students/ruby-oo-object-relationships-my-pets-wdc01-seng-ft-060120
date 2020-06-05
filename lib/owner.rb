require './cat.rb'
require './dog.rb'

class Owner
  # code goes here
  attr_reader :name, :species
  attr_writer
  attr_accessor
  @@all = [] 

  def initialize (name, species="human")
    @name = name
    @species = species
    say_species
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def Owner.all
    return @@all
  end

  def Owner.count
    return @@all.count
  end



end