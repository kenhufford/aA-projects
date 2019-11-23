class Cat < ApplicationRecord
  color = ["brown", "black", "ginger", "grey", "white"]
  validates :birth_date, :name, presence: true
  validates :color, inclusion: { in: color, message: "%{value} is not a valid color"}
  validates :sex, inclusion: { in: %w(m f M F), message: "%{value} is not a valid gender"}

  has_many :cat_rental_requests

  def age
    @age = Time.now.year - birth_date.year
  end

  
end
