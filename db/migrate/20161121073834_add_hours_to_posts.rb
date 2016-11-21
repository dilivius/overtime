class AddHoursToPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :overtime_request, :hours
  end
end
