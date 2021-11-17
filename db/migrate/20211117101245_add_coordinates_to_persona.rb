class AddCoordinatesToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :latitude, :float
    add_column :personas, :longitude, :float
  end
end
