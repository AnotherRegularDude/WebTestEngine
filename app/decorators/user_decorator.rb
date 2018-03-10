class UserDecorator < ApplicationDecorator
  def full_name
    [object.last_name, object.first_name].join(' ')
  end

  def as_json(options = {})
    super(options).except('password_digest', 'email_confirmation').merge('full_name' => full_name)
  end
end
