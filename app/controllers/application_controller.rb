class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  def after_sign_in_path_for(resource)
    startup_schools_path
  end
end
