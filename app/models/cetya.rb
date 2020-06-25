class Cetya < ApplicationRecord
    has_many :members
    validates :cetya_name, presence: true
end
