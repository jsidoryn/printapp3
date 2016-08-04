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

	private

	def signup_params
		params.require(:signup_designer).permit(:title, :email, :password, :password_confirmation)
	end
end
