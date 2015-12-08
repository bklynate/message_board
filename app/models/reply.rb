class Reply < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :content, presence: true
end
