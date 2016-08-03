class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
			t.integer :client_id
			t.integer :designer_id
			t.integer :printer_id

      t.timestamps
    end
  end
end
