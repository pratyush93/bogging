class User < ActiveRecord::Base
	before_save { self.email = email.downcase}
	
	VAL =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name, presence: true, length: { maximum: 50}
    validates :email,presence: true,format: {with: VAL}, uniqueness: { case_sensitive: false}
    has_secure_password
    validates :password, length: { minimum:6 }
end
