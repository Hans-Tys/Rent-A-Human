class FixUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :Last_name, :last_name
  end
end
