class UserMailer < ApplicationMailer

    def notificacion
        @user=params[:user]
        @turnoHoy=@user.turnos.where(["estado = ? and fecha = ?", 0, Date.today]).first
        mail(to: @user.email, subject: 'Recordatorio de tu turno')
    end
end
