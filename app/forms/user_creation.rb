class UserCreation < ApplicationForm
  attr_reader :user

  attribute :username, String
  attribute :password, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :patronymic, String

  validates :username, :password, presence: true

  def username=(value)
    @username = value.downcase
  end

  private

  def persist!
    @user = User.create!(attributes)
  rescue ActiveRecord::RecordInvalid => invalid
    self.errors = invalid.errors
  end
end
