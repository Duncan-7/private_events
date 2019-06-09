class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :guestlists, foreign_key: :attended_event_id
  has_many :attendees, through: :guestlists 

  validates :name, presence: true

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }

  # def Event.past
  #   Event.where("date < ?", Time.now)
  # end

  # def Event.upcoming
  #   Event.where("date > ?", Time.now)
  # end
    
end
