# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

bill = User.create(name: 'Bill')
john = User.create(name: 'John')
Note.create!(text: 'First bill note', user: bill)
Note.create!(text: 'second bill note', user: bill)
Note.create!(text: 'First john note', user: john)
Note.create!(text: 'second john note', user: john)