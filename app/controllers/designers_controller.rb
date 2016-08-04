class DesignersController < ApplicationController
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
		@signup_designer = Designer.find(params[:id])
	end

	def update
		
	end

	private

	def signup_params
		params.require(:designer).permit(:title, :email, :password, :password_confirmation)
	end
end
