class User < ActiveRecord::Base
  has_many :attempts
  has_many :test_attempts

  has_secure_password
end
