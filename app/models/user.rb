class User < ApplicationRecord
  has_secure_password

  enum role: %i[student teacher administrator]

  def self.from_token_request(request)
    username = request.params.dig('auth', 'username')
    return if username.blank?

    find_by(username: username.downcase)
  end
end
