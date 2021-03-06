# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  City.create(city_name: Faker::Address.city)
end

15.times do  
  paris =  City.all.sample
  Dogsitter.create(name: Faker::Name.last_name, city: paris)
  Dog.create(name: Faker::Creature::Dog.name, city: paris)
end

25.times do
  dog = Dog.all.sample
  dogsit = Dogsitter.all.sample
  if dogsit.city == dog.city
    Stroll.create(
    dogsitter: dogsit,
    dog: dog,
    )
  end
end
