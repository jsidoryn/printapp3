class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	belongs_to :organisation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	def designer?
		self.organisation.type == "Designer"
	end
	
	def client?
		self.organisation.type == "Client"
	end

	def printer?
		self.organisation.type == "Printer"
	end

end
