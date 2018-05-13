class AuthenticationForm < ApplicationForm
  attr_reader :user

  attribute :username, String
  attribute :password, String

  def username=(value)
    @username = value.downcase
  end

  private

  def persist!
    @user = User.find_by(username: username)&.authenticate(password)
    if @user.present? && @user.activated?
      @user = @user.decorate
      return true
    end

    errors.add(:username, :invalid)
    errors.add(:password, :invalid)
    false
  end
end
