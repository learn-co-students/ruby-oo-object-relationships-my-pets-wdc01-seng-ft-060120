class Dog
  # code goes here
  attr_reader :name 
  attr_accessor :owner 

  def initialize(name, owner)
    @name = name
    @owner = owner
  end

end