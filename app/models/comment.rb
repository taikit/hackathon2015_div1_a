class Comment < ActiveRecord::Base
      belongs_to :user
      belongs_to :ankle
      validates :body , length: { maximum: 5 }
end
