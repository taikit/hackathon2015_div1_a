class Battle < ActiveRecord::Base
  belongs_to :winner, class_name: "Ankle", foreign_key: :win_ankle_id
  belongs_to :loser, class_name: "Ankle", foreign_key: :lose_ankle_id
  belongs_to :user

  def save_with_cal
    dr = 16 + (loser.score - winner.score) * 0.04
    winner.score = winner.score + dr

  end
end
