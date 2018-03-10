class UserInformationUpdater < ApplicationService
  def initialize(user:, current_user:, update_params:)
    @user = user
    @current_user = current_user

    @params = update_params
  end

  def call
    return unless @current_user == @user

    form = UserUpdatingForm.new(@params)
    form.user = @user

    status = if form.save
               :ok
             else
               :bad_request
             end

    { status: status, form: form }
  end
end
