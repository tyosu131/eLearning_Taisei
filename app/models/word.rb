class Word < ApplicationRecord
  belongs_to :category
  validates :word, presence: true, length: { minimum: 1 }
end
