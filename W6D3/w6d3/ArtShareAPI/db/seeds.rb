# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

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
  {artwork_id: 1, viewer_id: 1}, 
  {artwork_id: 2, viewer_id: 2}, 
  {artwork_id: 3, viewer_id: 3}, 
  {artwork_id: 4, viewer_id: 4}
]

artwork_share.each do |hash|
  ArtworkShare.create(hash)
end


  