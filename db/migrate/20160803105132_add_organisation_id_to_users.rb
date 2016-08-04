class AddOrganisationIdToUsers < ActiveRecord::Migration[5.0]
  def change
		add_column :users, :organisation_id, :integer
  end
end
