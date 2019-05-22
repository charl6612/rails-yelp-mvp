# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating database...'
10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    category: %w[chinese italian japanese french belgian].sample
  )
end

restos = Restaurant.all

restos.each do |rest|
  10.times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: [0, 1, 2, 3, 4, 5].sample,
      restaurant: rest
    )
  end
end
