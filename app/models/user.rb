class User < ActiveRecord::Base
  attr_accessible :email, :fullname, :language, :last_login, :password, :password_flg, :role_id, :status, :username

  belongs_to :role
  has_many :client_users

  has_secure_password

  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
