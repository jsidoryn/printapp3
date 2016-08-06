class Job < ApplicationRecord
  belongs_to :client
  belongs_to :designer
  belongs_to :printer

	validates :title, presence: true

	scope :designer_organisations, -> (organisation) { where(designer: organisation) }
	scope :client_organisations, -> (organisation) { where(client: organisation) }
end
