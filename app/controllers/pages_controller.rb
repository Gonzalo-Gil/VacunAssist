class PagesController < ApplicationController
  def home
    if signed_in?
      case current_user.role
        when "paciente" 
          redirect_to perfil_path
        when "admin" 
          redirect_to admin_root_url
        when "enfermero"
          redirect_to turnos_path
      end
    else
      redirect_to new_user_session_url
    end
  end
end