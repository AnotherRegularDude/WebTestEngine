class EmailerJob < ApplicationJob
  def perform(user)
    UserMailer.check_email(user).deliver_now
  end
end
