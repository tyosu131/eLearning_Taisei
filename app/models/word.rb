class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  validates :word, presence: true, length: { minimum: 1 }
  accepts_nested_attributes_for :choices
end
