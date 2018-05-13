module Api
  class TopicsController < Api::ApplicationController
    before_action :find_topic, except: %i[index create]

    def index
      @topics = Topic.order(:id).page(params[:page]).decorate
    end

    def show; end

    def create
      authorize Topic

      @form = TopicForm.new(topic_params)
      if @form.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    def update
      authorize Topic

      @form = TopicForm.new({ topic: @topic }.merge(topic_params))

      if @form.save
        render :create, status: :ok
      else
        render :create, status: :bad_request
      end
    end

    def destroy
      authorize Topic

      @topic.destroy
      head :ok
    end

    private

    def topic_params
      params.require(:topic).permit(:title, :short_description, :complete_time, :complete_percentage)
    end

    def find_topic
      @topic = Topic.find_by!(id: params[:id]).decorate
    end
  end
end
