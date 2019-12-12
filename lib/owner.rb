require "pry"

class Owner
  # code goes here

  attr_reader :name, :species 

  attr_writer 

  @@all = []

  def initialize(name="nemo")

    @name = name 
    @species = "human"
    @@all << self 
  end 

  def say_species

    return "I am a #{self.species}."
  end 

  def self.all 

    return @@all
  end 

  def self.count 

    return @@all.length 
  end 

  def self.reset_all 
    
    @@all.clear 
  end 

  def cats 

    Cat.all.map do |specific_cat|
      
      self == specific_cat.owner 
    end 
    binding.pry 
  end 

end