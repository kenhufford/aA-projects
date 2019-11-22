# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all
Comment.destroy_all
Like.destroy_all

users = [
  {name: 'ken', email: 'ken', username: 'ken', password_digest: '123144212'}, 
  {name: 'zen', email: 'zen', username: 'zen', password_digest: '123144212'}, 
  {name: 'jen', email: 'jen', username: 'jen', password_digest: '123144212'}, 
  {name: 'zedd', email: 'zedd', username: 'zedd', password_digest: '123144212'}
]

users.each do |hash|
  User.create(hash)
end

artworks = [
{ title: 'Art1', image_url: '1', artist_id: 1},
{ title: 'Art2', image_url: '2', artist_id: 2},
{ title: 'Art3', image_url: '3', artist_id: 3},
{ title: 'Art4', image_url: '4', artist_id: 4}
]


artworks.each do |hash|
  Artwork.create(hash)
end

    

artwork_share = [
  {artwork_id: 1, viewer_id: 4}, 
  {artwork_id: 2, viewer_id: 3}, 
  {artwork_id: 3, viewer_id: 2}, 
  {artwork_id: 4, viewer_id: 1}
]

artwork_share.each do |hash|
  ArtworkShare.create(hash)
end

comments = [
  {body: 'this sucks', author_id: 1, artwork_id: 4}, 
  {body: 'throw it in the trash', author_id: 2, artwork_id: 3}, 
  {body: 'wow so amazing', author_id: 3, artwork_id: 2}, 
  {body: 'zedd', author_id: 4, artwork_id: 1}
]

comments.each do |hash|
  Comment.create(hash)
end

likes = [
  {liked_id: 2, liked_type: 'Comment', author_id: 1 },
  {liked_id: 3, liked_type: 'Comment', author_id: 2 },
  {liked_id: 4, liked_type: 'Artwork', author_id: 3 },
  {liked_id: 1, liked_type: 'Artwork', author_id: 4 }
]

likes.each do |hash|
  Like.create(hash)
end
  