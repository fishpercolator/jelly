class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :report
      t.string :text

      t.timestamps
    end
    add_index :tasks, :report_id
  end
end
