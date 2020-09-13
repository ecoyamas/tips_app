class Income < ApplicationRecord
  belongs_to :user
  belongs_to :user_group, optional: true

  validates :user_id, presence: true
  validates :salary_date, presence: true
  validates :salary_name, presence: true
  validates :income_amount, presence: true, numericality: { only_integer: true }
end
