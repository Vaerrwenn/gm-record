class Member < ApplicationRecord
    belongs_to :cetya
    validates :name, presence: true, length: {minimum:3}
    validates :gender, presence: true
end
