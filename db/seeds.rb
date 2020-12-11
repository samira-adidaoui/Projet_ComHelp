# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Message.destroy_all
Message.reset_pk_sequence

Conversation.destroy_all
Conversation.reset_pk_sequence

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

category_array = ["Bricolage",
                "Jardinage",
                "Soutien scolaire",
                "Garde d'enfants",
                "Déménagement",
                "Dons de matériel", 
                "Service à la personne",
                "Animaux",
                "Informatique/Bureautique",
                "Administratif"]

picture_array = ["https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/Bricolage/Bricolage+1280.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/Bricolage/jardinage+1280.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/cours+particuliers/soutien+scolaire.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/enfants/les+petits+nouveau+2.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/demenagement/d%C3%A9m%C3%A9nagement.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/dons/dons+de+materiel.jpeg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/Service+%C3%A0+la+personne/services-%C3%A0-la-personne.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/animaux/Animaux.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/informatique_bureautique/computer-1245714_640.jpg",
                "https://comhelp.s3.eu-west-3.amazonaws.com/comhelp/administratif/Administratif.jpg"]

99.times do
    City.create(city_name: Faker::Address.unique.city)
end

(category_array.length).times do |i|
    Category.create(name: category_array[i],
    picture_url: picture_array[i])
end

5.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email(domain: 'yopmail.com'), password: "password")
end  

1.times do
    Post.create(datetime: rand(t1..t2), title: Faker::Lorem.sentence(word_count: 6), user: User.all.sample, description: Faker::Lorem.sentence(word_count: 30), city: City.all.sample, category: Category.all.sample)
  end

1.times do
    Participation.create(user: User.all.sample, post: Post.all.sample)
end

