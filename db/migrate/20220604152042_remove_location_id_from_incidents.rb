class RemoveLocationIdFromIncidents < ActiveRecord::Migration[6.1]
def change
  remove_reference :incidents, :location, index: true, foreign_key: true
end
end
