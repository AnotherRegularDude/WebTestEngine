node(:meta) { @articles.links }

child(@articles, root: :data, object_root: false) do
  attributes :id, :title, :short_description
end
