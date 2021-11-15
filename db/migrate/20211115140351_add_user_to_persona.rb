class AddUserToPersona < ActiveRecord::Migration[6.0]
  def change
    add_reference :personas, :user, null: false, foreign_key: true
  end
end
