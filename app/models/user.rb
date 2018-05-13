class User < ApplicationRecord
  has_secure_password
  has_secure_token :email_confirmation

  enum role: %i[student teacher administrator]

  scope :with_token, ->(token) { where(email_confirmation: token) }
  scope :with_role, ->(role) { where(role: role) if role.present? }
end
