class EmailerJob < ApplicationJob
  def perform(user)
    user.reload
    UserMailer.check_email(user).deliver_now
  end
end
