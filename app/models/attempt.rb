class Attempt < ActiveRecord::Base
  belongs_to :level
  validates :text, presence: true

  def percent_correct
    expected = level.text.split("") #"Here is a typing test."
    input = text.split("")  #"Here is a typ."
    letters_correct = 0.0
    expected.each_with_index do | letter, i |
      if letter == input[i]
        letters_correct += 1
      end
    end
    score = letters_correct / expected.length
    (score.round(2) * 100).to_i
  end
end
