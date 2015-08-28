# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  note = Note.create({title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: 1})

  3.times do
    tag = Tag.create({name: Faker::Lorem.word})
    note.tags << tag
  end


end
