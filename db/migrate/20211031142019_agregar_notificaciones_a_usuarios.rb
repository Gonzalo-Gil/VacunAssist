class AgregarNotificacionesAUsuarios < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :notificacion, :boolean
    add_column :users, :medio_notificacion, :string
  end
end
