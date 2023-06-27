# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Word.destroy_all
Category.destroy_all

proffesions = Category.create(name: "Proffesions")
animals = Category.create(name: "Animals")

%w[Accountant Actor].each do |word|
    Word.create(name: word, category: proffesions)
end

%w[Alligator Ant].each do |word|
    Word.create(name: word, category: animals)
end
