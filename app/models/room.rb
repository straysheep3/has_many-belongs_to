class Room < ActiveRecord::Base
  has_many :chats
  belongs_to :user
end
