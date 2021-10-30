class TurnosController < ApplicationController
  
    before_action :authenticate_user!
    def index
        @turnos=Turno.where(user: current_user)
    end
  
    def show
    end
  
    def edit    
    end
    
    def destroy
    end
  end