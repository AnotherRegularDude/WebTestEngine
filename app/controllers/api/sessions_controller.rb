module Api
  class SessionsController < Api::ApplicationController
    skip_before_action :authenticate_user, only: :create

    def create
      @form = AuthenticationForm.new(session_params)

      if @form.save
        session[:user_id] = @form.user.id
        render 'api/users/create', status: :created
      else
        render 'api/users/create', status: :bad_request
      end
    end

    def show
      @user = current_user.decorate

      render 'api/users/show'
    end

    def destroy
      session.reset!
    end

    private

    def session_params
      params.require(:auth).permit(:username, :password)
    end
  end
end
