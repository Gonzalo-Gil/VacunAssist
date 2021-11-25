class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :check_tiene_vacuna_covid, unless: :devise_controller?

    protected def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :dni, :fecha_nacimiento, :telefono, :email, :notificacion, :medio_notificacion])
        devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :telefono, :email, :notificacion, :medio_notificacion])
    end

    def check_tiene_vacuna_covid 
        puts "Entre al check"
        if( user_signed_in? && current_user.role == "paciente" )
            puts "Entre al if"
            @covid19 = Enfermedad.where(nombre: "COVID").first
            tieneVacunaCovid = current_user.turnos.where(["enfermedad_id = ? and estado != ?", @covid19.id, 1]).count
            if tieneVacunaCovid == 0
                redirect_to new_turno_path(id: @covid19.id), notice: "Por favor solicite turno para COVID-19"
            elsif tieneVacunaCovid > 0
                vacuna = current_user.turnos.where(["enfermedad_id = ? and estado != ?", @covid19.id, 1]).first.vacuna
                if tieneVacunaCovid < vacuna.esquema.cant_dosis 
                    redirect_to new_turno_path(id: @covid19.id), notice: "Por favor solicite turno para COVID-19"
                end
            end
        end
    end
end
