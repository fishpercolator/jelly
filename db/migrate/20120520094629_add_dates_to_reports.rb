class AddDatesToReports < ActiveRecord::Migration
  def change
    add_column :reports, :today, :date
    add_column :reports, :previous_day, :date
  end
end
