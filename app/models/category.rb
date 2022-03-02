class Category < ApplicationRecord
  has_many :words 
  validates :title, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }
end
