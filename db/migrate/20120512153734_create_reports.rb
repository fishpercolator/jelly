class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user
      t.integer :jelly
      t.text :help_needed

      t.timestamps
    end
    add_index :reports, :user_id
  end
end
