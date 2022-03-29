# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tag = ["High Fantasy", "Low Fantasy", "Grim Dark", "Light Hearted", "SFW", "NSFW", "18+", "PG"]

tag.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag).save
end