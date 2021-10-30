class CreateVacunas < ActiveRecord::Migration[6.1]
  def change
    create_table :vacunas do |t|
      t.integer :enfermedad_id
      t.integer :cant_dosis
      t.integer :laboratorio_id

      t.timestamps
    end
  end
end
