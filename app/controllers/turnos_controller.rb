class TurnosController < ApplicationController
  
    before_action :authenticate_user!
    def index
        @turnos=Turno.where(user: current_user)
    end

    def new
        @turno = Turno.new
        if params[:id].to_i == 1
            @turno.vacuna_id = 10
        end
    end

    def create
        @turno = Turno.new(user_id: current_user.id, estado: "pendiente", sede_id: params[:turno][:sede_id], enfermedad_id: params[:turno][:enfermedad_id], fecha: params[:turno][:fecha])
        if Sede.find(params[:turno][:sede_id].to_i).turno.where(fecha: params[:turno][:fecha]).count < 3
            @turno.enfermedad_id = params[:enfermedad_id]
            if @turno.save
                redirect_to turnos_path
                flash[:notice] = "Turno guardado con éxito"
            else                
                redirect_to new_turno_url
                flash[:alert] = "Hubo un error al pedir el turno"
            end
        else            
            redirect_to new_turno_url
            flash[:alert] = "No hay turnos disponibles para la fecha seleccionada"
        end
    end

    def cargar
        @turno = Turno.new
    end

    def crear
        @turno = Turno.new(user_id: current_user.id, estado: "previo", vacuna_id: params[:turno][:vacuna_id], fecha: params[:turno][:fecha])
        if @turno.save
            redirect_to turnos_cargar_url
            flash[:notice] = "Vacuna ingresada con éxito. Ingrese otra vacuna o presione 'Terminar' para salir."
        else
            flash[:error] = "Hubo un error al cargar el turno"
            render :cargar
        end
    end
  
    def pedir_turno
    end

    def show
    end

    def update
        @turno=Turno.find(params[:id])
        if @turno.estado =="pendiente"
            @turno.estado="cancelado"
            @turno.save
            redirect_to turnos_path, notice: "Se ha cancelado el turno"
        end
    end
  
    def edit
    end
    
    def destroy
    end
  end