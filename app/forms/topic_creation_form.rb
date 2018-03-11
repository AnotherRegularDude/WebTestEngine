class TopicCreationForm < ApplicationForm
  attr_reader :topic

  attribute :title, String
  attribute :short_description, String
  attribute :number_of_questions, Integer

  validates :title, :short_description, :number_of_questions, presence: true
  validates :number_of_questions, numericality: { greater_than: 0 }

  def title=(value)
    @title = value.titleize
  end

  private

  def persist!
    @topic = Topic.create!(attributes).decorate
  rescue ActiveRecord::RecordInvalid => invalid
    @errors = invalid.record.errors
  end
end
