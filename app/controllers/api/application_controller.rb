module Api
  class ApplicationController < ActionController::Base
    include Knock::Authenticable
    include Pundit

    before_action :authenticate_user

    rescue_from Pundit::NotAuthorizedError, with: :not_allowed

    private

    def not_allowed
      head :forbidden
    end
  end
end
