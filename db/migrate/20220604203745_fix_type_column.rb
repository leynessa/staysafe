class FixTypeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :incidents, :type, :incident_type
  end
end
