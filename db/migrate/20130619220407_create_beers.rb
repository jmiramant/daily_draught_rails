class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
    	t.references :brewery
    	t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :beers
  end
end



