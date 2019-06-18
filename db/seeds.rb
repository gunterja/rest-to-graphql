# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
user = User.create(
  first_name: "Jeremy",
  last_name: "Gunter",
  email: "jeremy.gunter@freshly.com"
)
20.times do
  User.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email
  )
end

Post.delete_all
post = Post.create(
  user: user,
  title: "First Post",
  body: "This is the first post for this example application."
)
50.times do
  Post.create(
    user: User.all.sample,
    title: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph(8, true, 4)
  )
end

Comment.delete_all
Comment.create(
  user: user,
  post: post,
  body: "I love my own post so much I commented on it."
)
100.times do
  Comment.create(
    user: User.all.sample,
    post: Post.all.sample,
    body: Faker::TvShows::RickAndMorty.quote
  )
end
