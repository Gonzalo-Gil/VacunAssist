class ApplicationController < ActionController::Base
    include ActionView::Helpers::UrlHelper
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :check_tiene_vacuna_covid, unless: :devise_controller?

    protected def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :dni, :fecha_nacimiento, :telefono, :email, :notificacion, :medio_notificacion])
    end

    def check_tiene_vacuna_covid 
        return if current_page?('/turnos/new') 
        if user_signed_in? 
            tieneVacunaCovid = current_user.turnos.joins(vacuna: [:enfermedad]).where("enfermedads.nombre = '#{Enfermedad::COVID}'")
            if !tieneVacunaCovid.exists? 
                redirect_to new_turno_path, notice: "Por favor solicite turno para COVID-19"

            end
        end
    end
end
