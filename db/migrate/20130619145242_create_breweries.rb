class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.text :description
      t.string :status_display
      t.string :locality
      t.string :website
      t.string :brewer_id
      t.string :country
      t.string :hours_of_operation
      t.string :location_type
      t.string :is_closed
      t.string :is_primary
      t.string :latlong
      t.string :sub_name
      t.string :location_type_display
      t.integer :year_opened

      t.timestamps
    end
  end
end
