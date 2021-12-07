class ReportesController < ApplicationController
    before_action :check_user_admin 
    def check_user_admin
        if (current_user.role != "admin")
            redirect_to root_path, notice: "Solo disponible para el Administrador."
        end
    end
    def create
        @turnos = Turno.where(['estado = ? AND fecha <= ? AND fecha >= ?', "completado", params[:fechaHasta], params[:fechaDesde]])
        
    end
end