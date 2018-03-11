module Api
  class TopicsController < ApplicationController
    def index
      @topics = Topic.order(:id).page(params[:page]).decorate
    end

    def create
      authorize Topic

      @form = TopicCreationForm.new(topic_params)
      if @form.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    private

    def topic_params
      params.require(:topic).permit(:title, :short_description, :number_of_questions)
    end
  end
end
