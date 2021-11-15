class AddActivityToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :activity, :string
  end
end
