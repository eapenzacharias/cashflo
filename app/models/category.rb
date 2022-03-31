class Category < ApplicationRecord
  validates :name, presence: true
  has_one_attached :icon
  belongs_to :user
  has_many :invoices
end
