ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(email: 'CsfddsJ')
  user2 = User.create!(email: 'Flarnie')
  user3 = User.create!(email: 'Jeff')
  user4 = User.create!(email: 'Georges St. Pierre')

  ShortenedUrl.destroy_all
  ShortenedUrl.create!(long_url: "user3", short_url: "course1", user_id: 1)
  ShortenedUrl.create!(long_url: "user4", short_url: "course2", user_id: 2)
  ShortenedUrl.create!(long_url: "user1", short_url: "course3", user_id: 3)
  ShortenedUrl.create!(long_url: "user2", short_url: "course4", user_id: 4)
end
