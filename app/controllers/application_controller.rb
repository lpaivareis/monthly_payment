class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :authentication

  protected
  
  def authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin_ops" && password == "billing"
    end
  end
end
