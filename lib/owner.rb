require 'pry'
class Owner
  attr_reader :name, :species
  @@all=[]
  def initialize(name)
    @name=name
    @species="human"
    @@all<<self
  end
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
  
  def sell_pets
    self.dogs.each {|dog| dog.mood="nervous" and dog.owner=nil}
    self.cats.each {|cat| cat.mood="nervous" and cat.owner=nil}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood="happy"}
  end
  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end
  def buy_dog(name)
    new_dog=Dog.new(name,self)
  end
  def buy_cat(name)
    new_cat=Cat.new(name,self)
  end

  def dogs
    Dog.all.select {|dog| dog.owner==self}
  end
  def cats
    Cat.all.select {|cat| cat.owner==self}
  end
  def self.reset_all
    self.all.clear
  end
  def self.count
    self.all.length
  end
  def say_species
    "I am a #{species}."
  end
  def self.all
    @@all
  end
end