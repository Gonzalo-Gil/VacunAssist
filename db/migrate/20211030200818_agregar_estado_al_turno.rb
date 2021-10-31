class AgregarEstadoAlTurno < ActiveRecord::Migration[6.1]
  def change
    add_column :turnos, :estado, :integer
  end
end
