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
    Cat.all.select {|specific_cat| self == specific_cat.owner}
  end 

  def dogs
    Dog.all.select {|specific_dog| self == specific_dog.owner}
  end

  def buy_cat(name)
    Cat.new(name, self)
    #passes self (owner instance) as an argument for the owner 
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|new_dog| new_dog.mood = "happy"}
    #changed map to each because no need to make and return new array
  end

  def feed_cats
    self.cats.each {|new_cat| new_cat.mood = "happy"}
  end

  def all_pets 

    #returns array of this owner's pets (dogs and cats)
    return self.cats + self.dogs 
  end 

  def sell_pets

    #changed map to each 
    # self.dogs.each do |sold_dog| 
    #   sold_dog.owner = nil
    #   sold_dog.mood = "nervous"
    # end

    # self.cats.each do |sold_cat| 
    #   sold_cat.owner = nil
    #   sold_cat.mood = "nervous"
    # end

    #cleaned up methods using an all_pets helper method instead
    self.all_pets.each do |pet|

      pet.mood = "nervous"
      pet.owner = nil
    end

  end



  def list_pets

    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end

end