node(:meta) { @users.links }

child(@users, root: :data, object_root: false) do
  attributes :id, :username, :created_at
end
