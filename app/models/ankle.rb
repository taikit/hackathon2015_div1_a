class Ankle < ActiveRecord::Base
  has_many :win_battles, :class_name => "Battle", :foreign_key => "win_ankle_id"
  has_many :lose_battles, :class_name => "Battle", :foreign_key => "lose_ankle_id"
  belongs_to :user
  mount_uploader :image, ImageUploader
end
