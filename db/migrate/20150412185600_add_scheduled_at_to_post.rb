class AddScheduledAtToPost < ActiveRecord::Migration
  def change
    add_column :posts, :scheduled_at, :datetime
  end
end
