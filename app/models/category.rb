class Category < ApplicationRecord
  has_many :words 
  has_many :lessons
  validates :title, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }
end
