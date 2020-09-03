class Event < ApplicationRecord
    has_many :attendances
    has_many :members, through: :attendances, dependent: :destroy
    has_one_attached :cover
    
    validates :name, presence: true, length: {minimum:3}
    validates :start_date, presence: true
    validates :location, presence: true
end
