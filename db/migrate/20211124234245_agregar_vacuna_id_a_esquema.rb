class AgregarVacunaIdAEsquema < ActiveRecord::Migration[6.1]
  def change
    add_column :esquemas, :vacuna_id, :integer
  end
end
