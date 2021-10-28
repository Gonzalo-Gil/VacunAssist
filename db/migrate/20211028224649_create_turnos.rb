class CreateTurnos < ActiveRecord::Migration[6.1]
  def change
    create_table :turnos do |t|
      t.date :fecha
      t.string :sede
      t.integer :vacuna_id
      t.integer :user_id

      t.timestamps
    end
  end
end
