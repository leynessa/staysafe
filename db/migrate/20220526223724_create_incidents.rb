class CreateIncidents < ActiveRecord::Migration[6.1]
  def change
    create_table :incidents do |t|
      t.string :location
      t.string :title
      t.string :type
      t.string :description
      t.string :time
      t.string :date

      t.timestamps
    end
  end
end
