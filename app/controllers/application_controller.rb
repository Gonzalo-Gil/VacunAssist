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
            @covid19 = Enfermedad.where(nombre: "COVID").first
            tieneVacunaCovid = current_user.turnos.where(enfermedad_id: @covid19.id).count
            if tieneVacunaCovid == 0
                redirect_to new_turno_path(id: @covid19.id), notice: "Por favor solicite turno para COVID-19"
            end
        end
    end
end
