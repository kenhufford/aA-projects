class User < ApplicationRecord
  has_secure_password
  validates :email, :name, :username, presence: true

  has_many :artworks,
  class_name: :Artwork,
  primary_key: :id,
  foreign_key: :artist_id

  has_many :comments, 
  dependent: :destroy,
  class_name: :Comment,
  primary_key: :id,
  foreign_key: :author_id

  has_many :artwork_shares,
  class_name: :ArtworkShare,
  primary_key: :id,
  foreign_key: :viewer_id  

  has_many :shared_artworks,
  through: :artwork_shares,
  source: :artwork

  has_many :likes,
  foreign_key: :author_id,
  class_name: :Like
end
