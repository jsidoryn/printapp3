class Job < ApplicationRecord
  belongs_to :client
  belongs_to :designer
  belongs_to :printer
end
