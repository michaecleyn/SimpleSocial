class AddPostIdToUrl < ActiveRecord::Migration
  def change
    add_reference :urls, :post_id, index: true
  end
end
