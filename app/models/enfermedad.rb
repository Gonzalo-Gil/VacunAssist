class Enfermedad < ApplicationRecord
has_many :vacunas
COVID="COVID-19"
    def covid? 
        nombre == COVID
    end
end
