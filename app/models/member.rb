class Member < ApplicationRecord
    validates :name, presence: true, length: {minimum:3}
    validates :gender, presence: true
end
