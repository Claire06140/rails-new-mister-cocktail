# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts "Destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "Destroy cocktails"
Cocktail.destroy_all if Rails.env.development?

puts "Finding the url...."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

puts "Starting opening the url and open it with .read method ..."
ingredients_to_parse = open(url).read

puts "About to parse on the url I just read..."
ingredients_parsed = JSON.parse(ingredients_to_parse)


puts "Done seeding ! Let's see if we have our ingredients !"

ingredients_parsed['drinks'].each do |ingredient|
  puts "#{ingredient['strIngredient1']} printed"
end

ingredients_parsed['drinks'].each do |ingredient|
  igr = Ingredient.create(name: ingredient['strIngredient1'])
  puts "#{igr.name} created"
end
