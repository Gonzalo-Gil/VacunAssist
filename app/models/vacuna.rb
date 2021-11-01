class Vacuna < ApplicationRecord
belongs_to :enfermedad
belongs_to :laboratorio
has_many :users
end
