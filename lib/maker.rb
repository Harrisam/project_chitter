require 'bcrypt'

class Maker

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :handle, String
  property :name, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
