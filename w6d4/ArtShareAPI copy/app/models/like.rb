class Like < ApplicationRecord

  belongs_to :liked,
  foreign_key: :author_id,
  class_name: :User


  belongs_to :liked,
  polymorphic: :true
end
