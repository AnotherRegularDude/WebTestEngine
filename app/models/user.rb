class User < ApplicationRecord
  has_secure_password
  has_secure_token :email_confirmation

  enum role: %i[student teacher administrator]

  scope :with_token, ->(token) { where(email_confirmation: token) }
  scope :with_role, ->(role) { where(role: role) if role.present? }

  def self.from_token_request(request)
    username = request.params.dig('auth', 'username')
    return if username.blank?

    user = find_by(username: username.downcase)
    return user if user&.activated
  end
end
