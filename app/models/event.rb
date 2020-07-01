class Event < ApplicationRecord
    has_many :events, through: :attendances
    validates :name, presence: true, length: {minimum:3}
    validates :start_date, presence: true
    validates :location, presence: true
end
