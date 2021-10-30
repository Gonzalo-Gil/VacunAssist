class CreateSedes < ActiveRecord::Migration[6.1]
  def change
    create_table :sedes do |t|
      t.string :nombre
      t.integer :calle
      t.integer :numero

      t.timestamps
    end
  end
end
