class Job < ApplicationRecord
  validates :title, :description, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
  validates :wage_upper_bound, presence: true
  validates :contact_email, presence: true

  def admin?
    is_admin
  end



end
