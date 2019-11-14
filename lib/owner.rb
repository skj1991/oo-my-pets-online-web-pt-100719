class Owner
  attr_accessor :pets
  attr_reader :name, :species
  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @pets = {:dogs => [], :cats => []}
    @@all << self
  end

  def say_species
   "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    @cats = Cat.all.select { |cat_obj| cat_obj.owner == self }
    @cats
  end

  def dogs
    @dogs = Dog.all.select { |dog_obj| dog_obj.owner == self }
    @dogs
   end

  def buy_cat(name)
    @cats = Cat.new(name, self)
    pets[:cats] << @cats
  end

  def buy_dog(name)
    @dogs = Dog.new(name, self)
    pets[:dogs] << @dogs
  end

  def walk_dogs
    dogs.map { |dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map { |cat| cat.mood = "happy"}
  end

  #def sell_pets
  #    dogs.each do |dog|
  #      dog.mood = "nervous"
  #      dogs.owner
  #    end
  #    cats.each do |cat|
  #      cat.mood = "nervous"
  #      cats.owner
  #    end
  #end

  def sell_pets
    pets.each do |type, pets|
      pets.map {|pet| pet.mood = "nervous"}
    end
    pets.clear
  end

  def list_pets
    all_dogs = dogs.count
    all_cats = cats.count
    return "I have #{all_dogs} dog(s), and #{all_cats} cat(s)."
  end


end
