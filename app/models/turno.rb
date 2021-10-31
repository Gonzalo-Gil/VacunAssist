class Turno < ApplicationRecord
    enum estado: [:pendiente, :cancelado, :completado]
    belongs_to :user
end
