require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts
  BCrypt::Engine.cost = 12

  attr_reader :password

  validates_confirmation_of :password
  validates_presence_of :password_digest

  def password=(unencrypted_password)
    if unencrypted_password.nil?
      self.password_digest = nil
    else
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(@password)
    end
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest) == unencrypted_password
      self
    else
      false
    end
  end

  def self.confirm(username_param, password_param)
    user = User.find_by({username: username_param})
    user.authenticate(password_param)    
  end

end
