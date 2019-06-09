class User < ApplicationRecord
  has_many :events_created, foreign_key: :creator_id, class_name: "Event"
  has_many :guestlists, foreign_key: :attendee_id
  has_many :attended_events, through: :guestlists

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }

end
