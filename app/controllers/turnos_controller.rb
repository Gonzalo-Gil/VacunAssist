class TurnosController < ApplicationController
  
    before_action :authenticate_user!
    def index
        @turnos=Turno.where(user: current_user)
    end

    def cargar
        @turno = Turno.new
    end

    def crear
        @turno = Turno.new(params.require(:turno).permit(:vacuna_id, :fecha, :user_id, :sede_id, :estado))
        if @turno.save
            redirect_to turnos_cargar_url
        else
            flash[:error] = "Hubo un error al cargar el turno"
            render :cargar
        end
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