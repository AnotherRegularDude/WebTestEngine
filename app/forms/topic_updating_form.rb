class TopicUpdatingForm < ApplicationForm
  attr_reader :topic

  attribute :title, String
  attribute :short_description, String
  attribute :number_of_questions, Integer

  validates :title, :short_description, :number_of_questions, presence: true, allow_nil: true
  validates :number_of_questions, numericality: { greater_than: 0 }, allow_nil: true

  def title=(value)
    @title = value.titleize
  end

  def topic=(value)
    @topic = value.decorate
  end

  private

  def persist!
    @topic.update!(attributes.compact)
  rescue ActiveRecord::RecordInvalid => invalid
    @errors = invalid.record.errors
  end
end
