class Registos < ActiveRecord::Migration[5.0]
  def change

    create_table :registos do |t|
      t.integer :temperatura
      t.integer :ruido
      t.integer :humidade
      t.string :data
      t.integer :local_id
  end
  end
end
