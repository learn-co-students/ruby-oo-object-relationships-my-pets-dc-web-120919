require 'pry'
class Owner
  # code goes here
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

  def say_species
    "I am a #{@species}."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat_array|
      cat_array.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_array|
      dog_array.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.map do |owners_dog_array|
      owners_dog_array.mood = "happy"
    end
  end

  def feed_cats
    cats.map do |owner_cat_array|
      owner_cat_array.mood = "happy"
    end
  end

  def sell_pets
    cats.map do |owner_cat_array|
      owner_cat_array.owner = nil
      owner_cat_array.mood = "nervous"
    end

    dogs.map do |owner_dog_array|
      owner_dog_array.owner = nil
      owner_dog_array.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end