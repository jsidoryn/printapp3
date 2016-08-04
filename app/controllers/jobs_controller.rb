class JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_designer, only: [:new, :create]

  def index
		if current_user && current_user.designer?
			@jobs = Job.where(designer: current_user.organisation)
		elsif current_user && current_user.client?
			@jobs = Job.where(client: current_user.organisation)
		else
			@jobs = nil
		end
  end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.designer = current_user.organisation
		if @job.save
			flash[:notice] = 'Job was successfully created.'
			redirect_to jobs_path 
		else
			render action: 'new'
		end
	end
	
	def job_params
		params.require(:job).permit(:title, :client_id, :designer_id)
	end

	def authenticate_designer
		unless current_user.designer?
			flash[:notice] = "You must be a Designer to add a job"
			redirect_to jobs_path
		end
		
	end
end
