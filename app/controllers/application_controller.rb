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
end
