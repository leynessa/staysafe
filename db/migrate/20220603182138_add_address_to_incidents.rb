class AddAddressToIncidents < ActiveRecord::Migration[6.1]
  def change
    add_column :incidents, :address, :string
  end
end
