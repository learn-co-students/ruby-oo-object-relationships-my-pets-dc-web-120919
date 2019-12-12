require "pry"
class Owner


  attr_reader :name, :species
  attr_accessor :cat

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
    @@all.length
  end

    def self.reset_all
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
            #create a cat cat.new
            #assign an Owner
          Cat.new(cat_name, self)
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
