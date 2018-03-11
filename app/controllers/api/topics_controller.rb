module Api
  class TopicsController < ApplicationController
    before_action :find_topic, except: %i[index create]

    def index
      @topics = Topic.order(:id).page(params[:page]).decorate
    end

    def show; end

    def create
      authorize Topic

      @form = TopicCreationForm.new(topic_params)
      if @form.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    def update
      authorize Topic

      @form = TopicUpdatingForm.new(topic_params)
      @form.topic = @topic

      if @form.save
        render :create, status: :ok
      else
        render :create, status: :bad_request
      end
    end

    def destroy; end

    private

    def topic_params
      params.require(:topic).permit(:title, :short_description, :number_of_questions)
    end

    def find_topic
      @topic = Topic.find_by!(id: params[:id]).decorate
    end
  end
end
