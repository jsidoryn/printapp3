class JobsController < ApplicationController
  def index
		if current_user && current_user.designer?
			@jobs = Job.where(designer: current_user.organisation)
		elsif current_user && current_user.client?
			@jobs = Job.where(client: current_user.organisation)
		else
			@jobs = nil
		end
  end
end
