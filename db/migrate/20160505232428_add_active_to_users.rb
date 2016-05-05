class AddActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :inactive, :boolean, default: false

    User.reset_column_information

    User.update_all(inactive: false)
  end
end
