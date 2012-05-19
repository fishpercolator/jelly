class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.references :report
      t.string :text

      t.timestamps
    end
    add_index :achievements, :report_id
  end
end
