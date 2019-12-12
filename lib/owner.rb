'req pry'

class Owner
   #will know about their pet
  #will be able to buy a pet
  #can manipulate pet mood with walking and feeding
  #can sell pet
@@all = []
  attr_reader :name, :species
  attr_accessor 

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end 
  
  def say_species
    return "I am a #{self.species}."
  end

  def Owner.all
    @@all
  end

  def Owner.count
   return @@all.length
  end

  def Owner.reset_all
  @@all.clear
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

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
#make new cat
#assign cat to owner
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy" 
    end 
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end 
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
 
end