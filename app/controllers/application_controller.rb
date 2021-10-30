class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellido, :dni, :fecha_nacimiento, :telefono])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:dni])
        devise_parameter_sanitizer.permit(:sign_in, except: [:email])
    end
end
