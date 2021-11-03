class AgregarEnfermedadIdATurno < ActiveRecord::Migration[6.1]
  def change
    add_column :turnos, :enfermedad_id, :integer
  end
end
