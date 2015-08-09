class Battle < ActiveRecord::Base
  belongs_to :winner, class_name: "Ankle", foreign_key: :win_ankle_id
  belongs_to :loser, class_name: "Ankle", foreign_key: :lose_ankle_id
  belongs_to :user

  def save_with_cal
    dr = 16 + (loser.score - winner.score) * 0.04
    if dr < 1
      dr = 1
    elsif dr > 31
      dr = 31
    end
    winner.score = winner.score + dr
    loser.score = loser.score - dr

    winner.save
    loser.save
    save
  end
end
