class AddExcitedToReports < ActiveRecord::Migration
  def change
    add_column :reports, :excited, :string
  end
end
