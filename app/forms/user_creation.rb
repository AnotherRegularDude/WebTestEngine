class UserCreation < ApplicationForm
  attr_reader :user

  attribute :username, String
  attribute :email, String
  attribute :password, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :patronymic, String

  validates :username, :password, presence: true
  validates :first_name, :last_name, presence: true, length: { maximum: 40 }
  validates :email, format: {
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: 'invalid email address'
  }

  def username=(value)
    @username = value.downcase
  end

  def email=(value)
    @email = value.downcase
  end

  private

  def persist!
    @user = User.create!(attributes).decorate

    EmailerJob.perform_later(@user)
  rescue ActiveRecord::RecordInvalid => invalid
    self.errors = invalid.errors
  end
end
