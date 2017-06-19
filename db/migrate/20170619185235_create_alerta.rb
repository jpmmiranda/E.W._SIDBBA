class CreateAlerta < ActiveRecord::Migration[5.0]
  def change
    create_table :alerta do |t|
      t.integer :sensor_id
      t.integer :user_id
      t.integer :max_temp
      t.integer :min_temp
      t.integer :max_luminosidade
      t.integer :min_luminosidade
      t.integer :max_pressao
      t.integer :min_pressao
      t.integer :max_humidade
      t.integer :min_humidade

      t.timestamps
    end
  end
end
