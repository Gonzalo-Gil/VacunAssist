class CreateEnfermedads < ActiveRecord::Migration[6.1]
  def change
    create_table :enfermedads do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
