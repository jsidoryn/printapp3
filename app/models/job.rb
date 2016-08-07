class Job < ApplicationRecord
  belongs_to :client
  belongs_to :designer
  belongs_to :printer

	validates :title, presence: true

	scope :designer_organisations, -> (organisation) { where(designer: organisation) }
	scope :client_organisations, -> (organisation) { where(client: organisation) }

	enum status: { new_job: 0, open: 1, closed: 2 }
end

