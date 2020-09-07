class Member < ApplicationRecord
    belongs_to :cetya
    has_many :attendances
    has_many :events, through: :attendances, dependent: :destroy
    has_one_attached :avatar

    validates :name, presence: true, length: {minimum:3}
    validates :gender, presence: true
    validate :acceptable_image

    def acceptable_image
        return unless avatar.attached?
        
        unless avatar.byte_size <= 5.megabyte
            errors.add(:avatar, "Ukuran gambar terlalu besar")
        end
    end
end
