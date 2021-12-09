class ReportesController < ApplicationController
    before_action :check_user_admin 
    def check_user_admin
        if (current_user.role != "admin")
            redirect_to root_path, notice: "Solo disponible para el Administrador."
        end
    end
    def create
        if (params[:reporte][:fechaDesde] > params[:reporte][:fechaHasta])
            redirect_to reportes_path
            flash[:alert] = "Fechas invalidas, intente nuevamente"
        end
        @enfermeros = User.where(role: "enfermero");
        @pacientes = User.where(role: "paciente");
        @users = User.all;
        @enfermedades = Enfermedad.all
        @laboratorios = Laboratorio.all
        @sedes = Sede.all
        if params[:reporte][:fechaDesde] == "" or params[:reporte][:fechaHasta] == ""
            @turnosCompletados = Turno.where(['estado = ?', 2])
            @turnosPerdidos = Turno.where(['estado = ?', 1])
            @turnos = Turno.where(['estado != ?', 3])           
        else
            @turnosCompletados = Turno.where(['estado = ? AND fecha <= ? AND fecha >= ?', 2, Date.parse(params[:reporte][:fechaHasta]), Date.parse(params[:reporte][:fechaDesde])])
            @turnosPerdidos = Turno.where(['estado = ? AND fecha <= ? AND fecha >= ?', 1, Date.parse(params[:reporte][:fechaHasta]), Date.parse(params[:reporte][:fechaDesde])])
            @turnos = Turno.where(['estado != ? AND fecha <= ? AND fecha >= ?', 3, Date.parse(params[:reporte][:fechaHasta]), Date.parse(params[:reporte][:fechaDesde])]) 
        end
        if params[:reporte][:sede_id] != ""
            @turnosCompletados=@turnosCompletados.where(sede_id: params[:reporte][:sede_id])
            @turnosPerdidos = @turnosPerdidos.where(sede_id: params[:reporte][:sede_id])
            @turnos = @turnos.where(sede_id: params[:reporte][:sede_id])
            @sedes = @sedes.where(id: params[:reporte][:sede_id])
        end
    end
end