class UserMailer < ApplicationMailer
  def check_email(user)
    @user = user.decorate
    @url = Rails.configuration.x.global_info.url + "/confirmations/#{@user.email_confirmation}"
    mail(to: @user.email, subject: 'Hi there! We need your confirmation.')
  end
end
