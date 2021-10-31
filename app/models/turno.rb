class Turno < ApplicationRecord
    enum estado: [:pendiente, :cancelado, :completado] #Podriamos poner un enum que sea previoRegistro o algo asi
    belongs_to :user
end
