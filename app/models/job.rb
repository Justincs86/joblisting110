class Job < ApplicationRecord
  validates :title, :description, presence: true

  def admin?
    is_admin
  end



end
