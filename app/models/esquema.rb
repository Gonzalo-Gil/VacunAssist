class Esquema < ApplicationRecord
    has_many :doses
    belongs_to :vacuna
end
