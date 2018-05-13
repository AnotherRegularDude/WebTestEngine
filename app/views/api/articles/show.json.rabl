object @article
attributes :id, :title, :body, :body_md, :created_at, :updated_at
child(@article.topic) { attributes :id, :title }
