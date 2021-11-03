class Turno < ApplicationRecord
    enum estado: [:pendiente, :cancelado, :completado, :previo] #Podriamos poner un enum que sea previoRegistro o algo asi
    belongs_to :user
    belongs_to :vacuna, optional: true
    belongs_to :sede, optional: true
end
