class ArticleDecorator < ApplicationDecorator
  def body
    object.body_raw
  end

  def as_json(options = {})
    super(options).except('body_raw').merge('body' => body)
  end
end
