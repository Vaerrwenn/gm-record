class Member < ApplicationRecord
    belongs_to :cetya
    has_many :attendances
    has_many :events, through: :attendances, dependent: :destroy
    has_one_attached :avatar

    validates :name, presence: true, length: {minimum:3}
    validates :gender, presence: true
end
