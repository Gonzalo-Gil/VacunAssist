class ReportesController < ApplicationController
    before_action :check_user_admin 
    def check_user_admin
        if (current_user.role != "admin")
            redirect_to root_path, notice: "Solo disponible para el Administrador."
        end
    end
    def create
        @turnosCompletados = Turno.where(['estado = ? AND fecha <= ? AND fecha >= ?', 2, Date.parse(params[:reporte][:fechaHasta]), Date.parse(params[:reporte][:fechaDesde])])
        @turnosPerdidos = Turno.where(['estado = ? AND fecha <= ? AND fecha >= ?', 1, Date.parse(params[:reporte][:fechaHasta]), Date.parse(params[:reporte][:fechaDesde])])
        @turnos = Turno.where(['fecha <= ? AND fecha >= ?', Date.parse(params[:reporte][:fechaHasta]), Date.parse(params[:reporte][:fechaDesde])])
        @enfermeros = User.where(role: "enfermero");
        @pacientes = User.where(role: "paciente");
        @users = User.all;
        @enfermedades = Enfermedad.all
        @laboratorios = Laboratorio.all
    end
    
end