class AddCoordinatesToIncidents < ActiveRecord::Migration[6.1]
  def change
    add_column :incidents, :latitude, :float
    add_column :incidents, :longitude, :float
  end
end
