module Api
  class UsersController < ApplicationController
    before_action :authenticate_user, except: [:create]
    before_action :find_user, only: %i[show destroy update]

    def index
      @users = User.order(:id).page(params[:page]).decorate
    end

    def create
      @form = UserCreation.new(create_user_params)
      if @form.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    def show; end

    def update; end

    def destroy
      if current_user == @user
        @user.destroy

        head :ok
      else
        head :forbidden
      end
    end

    private

    def create_user_params
      params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :patronymic)
    end

    def find_user
      @user = User.find_by!(id: params[:id]).decorate
    end
  end
end
