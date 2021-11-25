class AgregarEsquemaIdADose < ActiveRecord::Migration[6.1]
  def change
    add_column :doses, :esquema_id, :integer
  end
end
