class User < ApplicationRecord
  attr_accessor :remember_token

  before_save{email.downcase!}

  EMAIL_VALIDATE_REGEX = Settings.email_validate_regex

  validates :name, presence: true,
    length: {maximum: Settings.USER_NAME_MAX_LENGTH}
  validates :email, presence: true,
    length: {maximum: Settings.USER_EMAIL_MAX_LENGTH},
    format: {with: EMAIL_VALIDATE_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.USER_PASSWORD_MIN_LENGTH}

  has_secure_password

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update remember_digest: nil
  end
end
