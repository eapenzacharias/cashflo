class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user }
  has_one_attached :icon
  belongs_to :user
  has_many :invoices
end
