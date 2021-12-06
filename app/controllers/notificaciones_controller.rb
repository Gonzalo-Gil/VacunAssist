class NotificacionesController < ApplicationController
    def enviarNotificaciones
        @turnos=Turno.where(["fecha = ? and estado = ?", Date.today, 0])
        @turnos.each do |turno|
            if turno.user.notificacion and turno.user.medio_notificacion == 'Correo electrónico'
            UserMailer.with(user: turno.user).notificacion.deliver_now
            end
        end
        redirect_to root_path
    end
end
