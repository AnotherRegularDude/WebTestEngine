class TopicForm < ApplicationForm
  attribute :title
  attribute :short_description
  attribute :complete_time
  attribute :complete_percentage

  def topic
    @topic ||= Topic.new.decorate
  end

  def topic=(value)
    @topic = value.decorate
  end

  def title=(value)
    @title = value.titleize
  end

  private

  def persist!
    topic.attributes = attributes.compact
    topic.save!

    true
  rescue ActiveRecord::RecordInvalid => invalid
    @errors = invalid.record.errors
    false
  end
end
