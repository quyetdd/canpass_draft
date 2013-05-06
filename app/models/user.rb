class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :fullname, :language, :last_login, :password, :password_flg, :role_id, :status, :username

  belongs_to :role
  has_many :client_users

  validates :username, presence: true, uniqueness: {case_sensitive: true}
  validates :email, presence:   true,
                    format:     {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

  before_save {|user| user.email = email.downcase}
end
