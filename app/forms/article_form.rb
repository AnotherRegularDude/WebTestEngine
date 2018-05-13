class ArticleForm < ApplicationForm
  attribute :title
  attribute :short_description
  attribute :body_md
  attribute :body_raw

  attr_reader :topic

  def topic=(value)
    @topic = value.decorate
  end

  def article
    @article ||= topic.articles.new.decorate
  end

  def article=(value)
    @article = value.decorate
  end

  def body
    @body_md
  end

  def body=(value)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

    @body_md = value
    @body_raw = markdown.render(@body_md)
  end

  private

  def persist!
    article.attributes = attributes.compact
    article.save!

    true
  rescue ActiveRecord::RecordInvalid => invalid
    @errors = invalid.record.errors
    false
  end
end
