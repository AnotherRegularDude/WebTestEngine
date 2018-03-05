module Api
  class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show]

    def create
      @form = UserCreation.new(user_params)
      if @form.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    def show
      @user = User.find_by!(id: params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name, :patronymic)
    end
  end
end
