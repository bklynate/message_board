class Message < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :title, presence: true
  validates :content, presence: true
end
