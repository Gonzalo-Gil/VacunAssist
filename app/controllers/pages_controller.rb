class PagesController < ApplicationController
  def home
    if signed_in?
      redirect_to perfil_path
    else
      redirect_to new_user_session_url
    end
  end
end