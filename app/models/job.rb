class Job < ApplicationRecord
  validates :title, :description, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
  validates :wage_upper_bound, presence: true
  validates :contact_email, presence: true
  has_many :resumes

  scope :recent, -> { order("created_at DESC") }

  def admin?
    is_admin
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  def publish!
    self.is_hidden = false
    self.save
  end




end
