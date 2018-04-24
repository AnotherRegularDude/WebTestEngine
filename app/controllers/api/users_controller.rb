module Api
  class UsersController < Api::ApplicationController
    skip_before_action :authenticate_user, only: [:create]
    before_action :find_user, except: %i[index create current]

    def index
      authorize User

      @users = User.order(:id).page(params[:page]).decorate
    end

    def create
      @form = RegistrationForm.new(user_create_params)
      if @form.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    def show; end

    def current
      @user = current_user

      render :show
    end

    def update
      authorize @user
      result = UserInformationUpdater.call(user: @user, update_params: user_update_params)

      if result.present?
        @form = result[:form]

        render :create, status: result[:status]
      else
        head :forbidden
      end
    end

    def destroy
      authorize @user
      @user.destroy

      head :ok
    end

    private

    def user_create_params
      params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :patronymic)
    end

    def user_update_params
      params.require(:user).permit(:password, :first_name, :last_name, :patronymic)
    end

    def find_user
      @user = User.find_by!(id: params[:id]).decorate
    end
  end
end
