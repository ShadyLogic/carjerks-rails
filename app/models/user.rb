require 'securerandom'

class User < ActiveRecord::Base
  include BCrypt
  has_many :reports

  def password
    @password ||= Password.new(password_hash) if password_hash.present?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
