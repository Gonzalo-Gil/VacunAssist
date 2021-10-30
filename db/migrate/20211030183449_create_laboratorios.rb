class CreateLaboratorios < ActiveRecord::Migration[6.1]
  def change
    create_table :laboratorios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
