class ApplicationController < ActionController::Base
	def stored_location_for(resource)
		nil
	end

	def after_sign_in_path_for(resource)
		user_records_path(current_user)
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
