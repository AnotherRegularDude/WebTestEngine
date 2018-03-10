class ConfirmationsController < ApplicationController
  def show
    if ConfirmationValidator.call(token: params[:id]).present?
      redirect_to root_url
    else
      head :bad_request
    end
  end
end
