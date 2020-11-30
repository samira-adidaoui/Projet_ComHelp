# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
User.reset_pk_sequence

Category.destroy_all
Category.reset_pk_sequence

City.destroy_all
City.reset_pk_sequence

Post.destroy_all
Post.reset_pk_sequence

Participation.destroy_all
Participation.reset_pk_sequence


t1 = Time.parse("2020-11-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")

10.times do
    City.create(city_name: Faker::Address.city)
end

10.times do
    Category.create(name: Faker::Job.field)
end

10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample, email: Faker::Internet.email(domain: 'yopmail.com'), password: "password")
end  

10.times do
    Post.create( datetime: rand(t1..t2), title: Faker::Lorem.sentence(word_count: 6), user: User.all.sample, description: Faker::Lorem.sentence(word_count: 30), city: City.all.sample, category: Category.all.sample)
  end

10.times do
    Participation.create(user: User.all.sample, post: Post.all.sample)
end

