class AgregarLoteTurnos < ActiveRecord::Migration[6.1]
  def change
    add_column :turnos, :lote, :string
  end
end
