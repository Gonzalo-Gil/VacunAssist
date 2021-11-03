class TurnosController < ApplicationController
    skip_before_action :check_tiene_vacuna_covid, only: [:new, :create, :fantasma]
  
    before_action :authenticate_user!
    def index
        @turnos=Turno.where(["user_id = ? and estado != ?", current_user.id, 3])
    end

    def new
        @turno = Turno.new
    end

    def create
        @turno = Turno.new(user_id: current_user.id, estado: "pendiente", sede_id: params[:turno][:sede_id], fecha: params[:turno][:fecha])        
        @turno.enfermedad_id = params[:enfermedad_id]
        # if params[:enfermedad_id] == nil
        #     @turno.enfermedad_id = Enfermedad.where(nombre: "COVID").id
        # end
        if @turno.save
            redirect_to turnos_fantasma_url
            flash[:notice] = "Turno guardado con éxito"
        else                
            redirect_to new_turno_url
            flash[:alert] = "Hubo un error al pedir el turno"
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
        @covid = Enfermedad.where(nombre: "COVID").first
        @gripe = Enfermedad.where(nombre: "Gripe").first
        @fiebre = Enfermedad.where(nombre: "Fiebre amarilla").first
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

    def fantasma
        redirect_to turnos_path
    end
  end