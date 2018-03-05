class ConfirmationValidator < ApplicationService
  def initialize(token:)
    @token = token
  end

  def call
    user = User.with_token(@token).first
    return if user.blank?

    user.activated = true
    user.email_confirmation = nil
    user.save

    user
  end
end
