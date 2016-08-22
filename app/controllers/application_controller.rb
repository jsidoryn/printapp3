class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
	def designer_access?
		current_user && current_user.designer?
	end

	def client_access?
		current_user && current_user.client?
	end

	def current_organisation
		current_user.organisation
	end

	def authenticate_designer
		unless current_user.designer?
			flash[:notice] = "You must be a Designer to do this"
			redirect_to jobs_path
		end
	end

end
