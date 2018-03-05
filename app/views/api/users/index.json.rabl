collection @users
attributes :id, :username, :created_at
node(:full_name) do |user|
  result = ''
  if user.last_name.present? && user.first_name.present?
    result = [user.last_name, user.first_name].join(' ')
  end

  result
end
