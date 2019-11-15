require "securerandom"

class ShortenedUrl < ApplicationRecord
  extend SecureRandom
  validates :long_url, :user_id, presence: true

  belongs_to(
    :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
  )

  def self.random_code
    short_url = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(:short_url => short_url)
      short_url = SecureRandom.urlsafe_base64
    end
    short_url
  end

  def self.shorten_url(user, long_url)
    ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
  end

end

