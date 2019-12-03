class Blog < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :title, uniqueness: {scope: :author_id}

  belongs_to :author,
  class_name: :User,
  foreign_key: :author_id

  has_many :comments,
  dependent: :destroy,
  class_name: :Comment,
  foreign_key: :blog_id


end
