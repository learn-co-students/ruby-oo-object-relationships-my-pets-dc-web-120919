require 'pry'
class Owner
  attr_reader :name, :species

  # code goes here
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    # @all_pets = []
  end 

  def self.all
    @@all 
  end 
  
  def say_species
    "I am a #{@species}."
  end 

  def self.count
    @@all.length
  end 

  def self.reset_all
    @@all.clear
  end


  
  def cats 
    # cats instance method 
    # returns a collection of all the cats that belong to the owner
      Cat.all.find_all do |kitty|
       kitty.owner == self
       
      end
    
  end

  def dogs
    Dog.all.find_all do |doggy|
      doggy.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  # if dog is walked mood = happy
  def walk_dogs
    Dog.all.select do |doggy|
      doggy.mood = "happy"
    end
  end

  def feed_cats 
    Cat.all.select do |kitty|
      kitty.mood = "happy"
    end
  end

  # when a pet is sold the pet no longer has an owner
  # change the pets mood to nervous
  # pets know who their owner is
  def sell_pets
    pets = self.dogs + self.cats
    
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end  
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
