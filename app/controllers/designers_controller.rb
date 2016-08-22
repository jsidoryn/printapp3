class DesignersController < ApplicationController

	before_action :authenticate_user!, except: [:new, :create]
	before_action :authenticate_designer, only: [:edit, :update]

  def new
		@signup_designer = SignupDesigner.new
  end

  def create
		@signup_designer = SignupDesigner.new(signup_params)
		if @signup_designer.save
			redirect_to jobs_path
			flash[:notice] = "Awesome work!"
		else
			render :new
		end
  end

	def edit
		@signup_designer = SignupDesigner.load(params[:id])
	end

	def update
		@signup_designer = SignupDesigner.new(signup_params)
		if @signup_designer.update(current_user.organisation.id)
			redirect_to jobs_path
			flash[:notice] = "You are awesome and handsome"
		else
			render :edit
		end
	end

	
	private
  
	def signup_params
		params.require(:designer).permit(:title, :email, :password, :password_confirmation)
	end
end
