class AgregarNombreVacunas < ActiveRecord::Migration[6.1]
  def change
    add_column :vacunas, :nombre, :string
  end
end
