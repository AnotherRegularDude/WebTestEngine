module Api
  class ApplicationController < ActionController::Base
    include Knock::Authenticable
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :not_allowed

    before_action :authenticate_user

    private

    def not_allowed
      head :forbidden
    end
  end
end
