class UserUpdatingForm < ApplicationForm
  attr_reader :user

  attribute :password, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :patronymic, String

  validates :password, length: { minimum: 1 }, allow_nil: true
  validates :first_name, :last_name, presence: true, length: { maximum: 40 }, allow_nil: true
  validates :patronymic, length: { maximum: 50 }, allow_nil: true

  def user=(value)
    @user = value.decorate
  end

  private

  def persist!
    @user.update!(attributes.compact)
    true
  rescue ActiveRecord::RecordInvalid => invalid
    @errors = invalid.record.errors
    false
  end
end
