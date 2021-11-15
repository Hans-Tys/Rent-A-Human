class AddLastNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Last_name, :string
  end
end
