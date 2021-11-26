class TurnosController < ApplicationController
    skip_before_action :check_tiene_vacuna_covid, only: [:new, :create, :fantasma, :cargar, :crear]
  
    before_action :authenticate_user!
    def index
        case current_user.role
        when "paciente"
            @turnos=Turno.where(["user_id = ? and estado != ?", current_user.id, 3])
        when "enfermero"
            @turnos=Turno.where(["fecha = ? and estado = ?", Date.today, 0])
            @turnosPrevios=Turno.where(["estado = ? or estado = ?", 2, 3]).order('fecha desc')
            # Solución provisoria: mandar todos los turnos previos y en la vista filtrar segun el paciente elegido
            # if params[:sede_id] == nil
            #     @turnos=Turno.where(["fecha = ? and estado = ?", Date.today, 0])
            #     @turnosPrevios=Turno.where(["estado = ? or estado = ?", 2, 3]).order('fecha desc')
            #     # Solución provisoria: mandar todos los turnos previos y en la vista filtrar segun el paciente elegido
            # else
            #     if params[:apellido] == ""
            #         @turnos=Turno.where(["fecha = ? and estado = ? and sede_id = ?", Date.today, 0, params[:sede_id]])
            #         @turnosPrevios=Turno.where(["estado = ? or estado = ?", 2, 3]).order('fecha desc')
            #     else
            #         @pacientes = User.where(["apellido = ?", params[:apellido]])
            #         @turnos=Turno.joins(:user).where(["fecha = ? and estado = ? and sede_id = ? and apellido LIKE ?", Date.today, 0, params[:sede_id], params[:apellido]])
            #         @turnosPrevios=Turno.where(["estado = ? or estado = ?", 2, 3]).order('fecha desc')
            #     end
            # end
        end
    end

    def filter
        if params[:apellido] == ""
            @turnos=Turno.where(["fecha = ? and estado = ? and sede_id = ?", Date.today, 0, params[:sede_id]])
            @turnosPrevios=Turno.where(["estado = ? or estado = ?", 2, 3]).order('fecha desc')
        else
            @pacientes = User.where(["apellido = ?", params[:apellido]])
            @turnos=Turno.joins(:user).where(["fecha = ? and estado = ? and sede_id = ? and apellido LIKE ?", Date.today, 0, params[:sede_id], params[:apellido]])
            @turnosPrevios=Turno.where(["estado = ? or estado = ?", 2, 3]).order('fecha desc')
        end
    end

    def new
        @enfermedad = Enfermedad.find(params[:id])
        @turno = Turno.new
    end

    def create
        @turno = Turno.new(user_id: current_user.id, estado: "pendiente", sede_id: params[:turno][:sede_id], fecha: params[:turno][:fecha])        
        @turno.enfermedad_id = params[:turno][:enfermedad_id]
        if (@turno.fecha.year != Date.tomorrow.year ||(@turno.fecha.month < Date.tomorrow.month && @turno.fecha.day < Date.tomorrow.day))
            redirect_to new_turno_url
            flash[:alert] = "Fecha ingresada no valida. Intente nuevamente"
        else
            if @turno.save
                redirect_to turnos_fantasma_url
                flash[:notice] = "Turno guardado con éxito"
            else                
                redirect_to new_turno_url(id: @turno.enfermedad_id)
                flash[:alert] = "Hubo un error al pedir el turno"
            end
        end
    end

    def cargar
        @turno = Turno.new
    end

    def crear
        @turno = Turno.new(user_id: current_user.id, estado: "previo", vacuna_id: params[:turno][:vacuna_id], fecha: params[:turno][:fecha])
        @turno.enfermedad_id = Vacuna.find(params[:turno][:vacuna_id]).enfermedad_id
        if (@turno.fecha.year > Date.today.year ||(@turno.fecha.month > Date.today.month && @turno.fecha.day > Date.today.day))
            redirect_to new_turno_url
            flash[:alert] = "Fecha ingresada no valida. Intente nuevamente"
        else
            if @turno.save
                redirect_to turnos_cargar_url
                flash[:notice] = "Vacuna ingresada con éxito. Ingrese otra vacuna o presione 'Terminar' para salir."
            else
                flash[:error] = "Hubo un error al cargar el turno"
                render :cargar
            end
        end
    end
  
    def pedir_turno
        @turnos = Turno.where(user: current_user)
        @tunosPend = @turnos.where(estado: :pendiente)
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
        @turno = Turno.find(params[:id])
        if(params[:turno][:aplicado]=="true")
            @turno.estado = "completado"
            @turno.vacuna = Vacuna.find(params[:laboratorio_id])
            @turno.lote = params[:turno][:lote]
            @esquema = Esquema.where(vacuna: @turno.vacuna).first
            @previos = Turno.where(["user_id = ? and enfermedad_id = ? and estado = ? or estado = ?", @turno.user_id, @turno.enfermedad_id, 2, 3]).count
            if (@esquema.cant_dosis > 1 && @previos < @esquema.cant_dosis)
                @dias = @esquema.doses.where(numeroDosis: @previos+1).first.dias
                @turnoAutomatico = Turno.new(user_id: @turno.user_id, estado: "pendiente", sede_id: @turno.sede_id, fecha: (@turno.fecha + (@dias).days), enfermedad_id: @turno.enfermedad_id)
                @turnoAutomatico.save
            end
        else
            @turno.estado="cancelado"
        end
        @turno.save        
        redirect_to root_path, notice: "Se actualizó la información del turno"
    end
    
    def destroy
    end

    def fantasma
        redirect_to turnos_path
    end
  end