class User < ApplicationRecord
    has_secure_password
    
    has_many :pictures
    has_many :pictures,through: :favorites
    has_many :favorites,dependent: :destroy
    
    validates :name,presence: true,length:{maximum: 30}
    validates :email,presence: true,length:{maximum: 100},uniqueness: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password,presence: true,length:{in: 6..100}
    before_save {email.downcase!}
end
