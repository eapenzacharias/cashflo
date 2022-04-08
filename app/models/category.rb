class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user }
  has_one_attached :icon
  validates :icon, presence: true

  belongs_to :user
  has_many :invoices
end
