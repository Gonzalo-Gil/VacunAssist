class Vacuna < ApplicationRecord
    belongs_to :enfermedad
    belongs_to :laboratorio
    has_one :esquema
end
