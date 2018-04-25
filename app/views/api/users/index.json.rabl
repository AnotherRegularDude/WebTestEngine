node(:meta) { @users.links }

child(@users, root: :data, object_root: false) do
  attributes :id, :username, :full_name, :email, :activated
end
