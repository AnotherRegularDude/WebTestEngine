module Api
  class ConfirmationsController < ApplicationController
    def show
      if ConfirmationValidator.call(token: params[:id]).present?
        head :ok
      else
        head :bad_request
      end
    end
  end
end
