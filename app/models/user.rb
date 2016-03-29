class User < ActiveRecord::Base
  has_secure_password
  has_many :article
  has_many :comments
  has_many :votes
  
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 3 }

end
