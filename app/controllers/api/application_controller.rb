module Api
  class ApplicationController < ActionController::Base
    include Pundit

    attr_reader :current_user
    rescue_from Pundit::NotAuthorizedError, with: :not_allowed

    before_action :authenticate_user

    private

    def authenticate_user
      @current_user = User.find_by(id: session[:user_id])

      return head :unauthorized if @current_user.blank?
    end

    def not_allowed
      head :forbidden
    end
  end
end
