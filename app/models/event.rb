class Event < ApplicationRecord
    has_many :attendances
    has_many :members, through: :attendances, dependent: :destroy
    has_one_attached :cover
    
    validates :name, presence: true, length: {minimum:3}
    validates :start_date, presence: true
    validates :location, presence: true
    validate :acceptable_image

    def acceptable_image
        return unless avatar.attached?
        
        unless avatar.byte_size <= 5.megabyte
            errors.add(:avatar, "Ukuran gambar terlalu besar")
        end
    end
end
