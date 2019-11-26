class User < ApplicationRecord
validates :user_name, presence: true
validates :password_digest, presence: {message: 'Password can\t be blank'}
validates :session_token, presence: true
validates :password, length: { minimum: 6, allow_nil: true }
attr_reader :password
after_initialize :ensure_session_token

   def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

   def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  has_many :cats,
  foreign_key: :user_id,
  class_name: :User

  has_many :cat_rental_requests

end
