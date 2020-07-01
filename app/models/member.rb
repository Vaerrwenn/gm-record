class Member < ApplicationRecord
    belongs_to :cetya
    has_many :events, through: :attendances
    validates :name, presence: true, length: {minimum:3}
    validates :gender, presence: true
end
