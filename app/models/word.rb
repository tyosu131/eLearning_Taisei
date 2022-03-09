class Word < ApplicationRecord
  belongs_to :category
  has_one :answer
  has_many :choices, dependent: :destroy
  validates :word, presence: true, length: { minimum: 1 }
  accepts_nested_attributes_for :choices

  validate :select_only_one_answer
  validate :no_same_choice 

  private
  def select_only_one_answer 
    count = choices.select{|answer| answer.is_answer?}.length  
    if count != 1 
      return errors.add(:word, "Error.")  
    end
  end

  def no_same_choice
    check = choices.uniq{|answer| answer.choice}.length
    if check < choices.length
      return errors.add(:word, "Error.")  
    end
  end
end
