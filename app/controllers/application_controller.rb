class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include MobileAuthenticationHelper

  before_action :authenticate_user_from_token, if: :is_mobile_app?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path
  end
end
