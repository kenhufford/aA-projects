class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many(
    :shortened_urls,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :user_id
  )
end
