class Jobs::StatusClosedController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_designer, only: [:new, :create]

	def index
		@jobs = Job.designer_organisations(current_organisation).closed
	end
end
