class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(resource)
        :turnos_cargar
    end
end
