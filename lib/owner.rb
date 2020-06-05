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

  

end