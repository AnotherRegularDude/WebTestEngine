module Api
  class ApplicationController < ActionController::Base
    include Knock::Authenticable
  end
end
