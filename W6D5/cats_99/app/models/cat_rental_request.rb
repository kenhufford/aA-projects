class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :cat_id, uniqueness: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "%{value} is not a valid status"}

  belongs_to :cat,
    dependent: :destroy

  def overlapping_requests
    request = CatRentalRequest
      .where.not(id: self.id)
      .where(:cat_id == self.cat_id)
      .where.not('end_date < ? AND start_date > ?', end_date
    request
  end
end
