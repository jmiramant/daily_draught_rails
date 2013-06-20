class Hophead < ActiveRecord::Base
  attr_accessible :email, :password_digest
  has_secure_password
end
