class Locais < ActiveRecord::Migration[5.0]
  def change

    create_table :locais do |t|
      t.integer :local_longitude
      t.integer :local_latitude
  end
  end
end
