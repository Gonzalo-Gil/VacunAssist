class Vacuna < ApplicationRecord
belongs_to :enfermedad
has_many :users

end
