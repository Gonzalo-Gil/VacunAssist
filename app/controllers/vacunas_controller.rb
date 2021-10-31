class VacunasController < ApplicationController
    before_action :authenticate_user!
    def index
        @turnos=Turno.where(user: current_user)
    end
end