class User < ActiveRecord::Base
  attr_accessor :password

  validates :password, confirmation: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true

  before_save :encrypt_password


  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)

  end
end
