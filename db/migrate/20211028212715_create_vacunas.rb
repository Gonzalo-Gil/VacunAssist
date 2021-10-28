class CreateVacunas < ActiveRecord::Migration[6.1]
  def change
    create_table :vacunas do |t|
      t.string :enfermedad
      t.integer :cant_dosis
      t.string :laboratorio

      t.timestamps
    end
  end
end
