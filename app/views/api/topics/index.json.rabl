node(:meta) { @topics.links }

child(@topics, root: :data, object_root: false) do
  attributes :id, :title, :created_at, :updated_at
end
