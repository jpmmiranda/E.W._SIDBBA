class Locais < ActiveRecord::Migration[5.0]
  def change

    create_table :locais do |t|
      t.decimal :local_longitude, :precision => 8, :scale => 6
      t.decimal :local_latitude,:precision => 8, :scale => 6
  end
  end
end
