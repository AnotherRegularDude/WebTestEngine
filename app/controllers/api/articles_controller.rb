module Api
  class ArticlesController < Api::ApplicationController
    before_action :find_topic, only: %i[index create]
    before_action :find_article, except: %i[index create]

    def index
      @articles = @topic.articles.order(:id).page(params[:page]).decorate
    end

    def show; end

    def create
      authorize Article

      @form = ArticleForm.new(article_params.merge(topic: @topic))
      if @form.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    def update
      authorize Article

      @form = ArticleForm.new(article_params.merge(article: @article))
      if @form.save
        render :create, status: :ok
      else
        render :create, status: :bad_request
      end
    end

    def destroy
      authorize Article

      @article.destroy
      head :ok
    end

    private

    def find_topic
      @topic = Topic.find(params[:topic_id]).decorate
    end

    def find_article
      @article = Article.find(params[:id]).decorate
    end

    def article_params
      params.require(:article).permit(:title, :short_description, :body)
    end
  end
end
