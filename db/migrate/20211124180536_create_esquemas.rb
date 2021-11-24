class CreateEsquemas < ActiveRecord::Migration[6.1]
  def change
    create_table :esquemas do |t|
      t.integer :cant_dosis

      t.timestamps
    end
  end
end
