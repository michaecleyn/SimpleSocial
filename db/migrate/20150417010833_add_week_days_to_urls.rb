class AddWeekDaysToUrls < ActiveRecord::Migration
  def change
  	add_column :urls, :monday, :boolean, default: false
  	add_column :urls, :tuesday, :boolean, default: false
  	add_column :urls, :wednesday, :boolean, default: false
  	add_column :urls, :thursday, :boolean, default: false
  	add_column :urls, :friday, :boolean, default: false
  	add_column :urls, :saturday, :boolean, default: false
  	add_column :urls, :sunday, :boolean, default: false
  end
end
