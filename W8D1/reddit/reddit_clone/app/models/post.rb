class Post < ApplicationRecord
  validates :title, presence: true

  has_many :post_subs, inverse_of: :post

  belongs_to :author,
    class_name: :User

  belongs_to :sub

  has_many :subs,
  through: :post_subs,
  source: :subs
end
