class VacunasController < ApplicationController
    before_action :authenticate_user!
    def index
        @vacunas=Vacuna.where(user: current_user)
    end
end