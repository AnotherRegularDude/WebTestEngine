class UserInformationUpdater < ApplicationService
  def initialize(user:, update_params:)
    @user = user
    @params = update_params
  end

  def call
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
