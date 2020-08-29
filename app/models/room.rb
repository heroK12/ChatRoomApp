class Room < ApplicationRecord
  validates :title, presence: true,
                    length: {minimum: 5}
  has_many :messages
  has_many :user
end
