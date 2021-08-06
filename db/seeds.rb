# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E'

puts "Reseting up database"

Movie.destroy_all

puts "Database empty"

puts "Importing movies from url page: #{1}"
elements = JSON.parse(open("#{url}?page = #{1}").read)['results']
10.times do |i|
  elements[i]
  puts "Creating #{elements[i]['title']}"
  Movie.create(
    title: elements[i]['title'],
    overview: elements[i]['overview'],
    rating: elements[i]['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500#{elements[i]['poster_path']}",
  )
end

puts "Movies created"