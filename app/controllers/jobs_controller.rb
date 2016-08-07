class JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_designer, only: [:new, :create]

  def index
		if designer_access? 
			@jobs = Job.designer_organisations(current_organisation).not_closed
		elsif client_access? 
			@jobs = Job.client_organisations(current_organisation).not_closed
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

	def edit
		@job = Job.find(params[:id])
	end

  def update
    @job = Job.find(params[:id])
		if @job.update(job_params)
			flash[:notice] = "Job added"
			redirect_to jobs_path
		else
			render :edit
		end
  end

	private

	def job_params
		params.require(:job).permit(:title, :client_id, :designer_id, :status)
	end

end

