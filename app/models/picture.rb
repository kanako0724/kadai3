class Picture < ApplicationRecord
    validates :comment,length:{maximum:140},presence: true
    validates :picture,presence: true
    
    belongs_to :user
    has_many :favorites,dependent: :destroy
    has_many :users,through: :favorites
    mount_uploader :picture,PictureUploader
    
    
end
