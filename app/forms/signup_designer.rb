class SignupDesigner
	include ActiveModel::Model

	attr_accessor :id, :title, :email, :password, :password_confirmation

	validates :title, :email, :password, :password_confirmation, presence: true

	def self.model_name
		ActiveModel::Name.new(self, nil, "Designer")
	end

	def self.load(id)
		designer = Designer.find(id)
		new(id: designer.id, title: designer.title)
	end

	def persisted?
		id.present?
	end

	def save
		if valid?
			ActiveRecord::Base.transaction do
				@designer = Designer.create(title: title)
				@user = User.create!(email: email, password: password, password_confirmation: password_confirmation, organisation_id: @designer.id)
			end
		end
	end

	def update(id)
		binding.pry
		# if valid?
			@designer = Designer.find(id)
			@designer.update!(title: @title)
		# end
	end
end
