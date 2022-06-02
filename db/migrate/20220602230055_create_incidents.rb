class CreateIncidents < ActiveRecord::Migration[6.1]
  def change
    create_table :incidents do |t|
      t.string :title
      t.string :type
      t.string :description
      t.datetime :time
      t.date :date
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
