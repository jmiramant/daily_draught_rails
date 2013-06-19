class CreateHopheads < ActiveRecord::Migration
  def change
    create_table :hopheads do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
