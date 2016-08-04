class SignupDesigner
	include ActiveModel::Model

	attr_accessor :title, :email, :password, :password_confirmation

	validates :title, :email, :password, :password_confirmation, presence: true

	def save
		if valid?
			@designer = Designer.create(title: title)
		  @user = User.create!(email: email, password: password, password_confirmation: password_confirmation, organisation_id: @designer.id)
		end
	end
end
