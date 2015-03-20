class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :status
      t.string :handle

      t.timestamps
    end
  end
end
