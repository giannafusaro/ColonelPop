class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ENDPOINT = "https://api-public.guidebox.com/v1.43/US/#{Rails.application.secrets[:guidebox_api_key]}"
  PER_PAGE = 15

end
