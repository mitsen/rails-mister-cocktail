# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
Cocktail.destroy_all
Ingredient.destroy_all


response = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredient = JSON.parse(response)

list = ingredient["drinks"]

list.each do |hash|
 value =  hash.values[0]
 ingredient = Ingredient.create(name: value)
end

