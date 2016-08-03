class CreateOrganisations < ActiveRecord::Migration[5.0]
  def change
    create_table :organisations do |t|
      t.string :title
      t.text :address
      t.string :phone
      t.string :email
      t.string :type

      t.timestamps
    end
  end
end
