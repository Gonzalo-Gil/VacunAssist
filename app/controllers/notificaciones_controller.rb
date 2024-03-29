class NotificacionesController < ApplicationController
    def enviarNotificaciones
        if current_user.role == "admin"
            @turnos=Turno.where(["fecha = ? and estado = ?", Date.today, 0])
            @turnos.each do |turno|
                if turno.user.notificacion and turno.user.medio_notificacion == 'Correo electrónico'
                UserMailer.with(user: turno.user).notificacion.deliver_now
                end
            end
        end
        redirect_to root_path, notice: "Notificaciones enviadas correctamente."
    end

    def comprobanteTurno
        @usuario = User.where(["id = ?", current_user.id]).first
        if @usuario.notificacion and @usuario.medio_notificacion == 'Correo electrónico'
            UserMailer.with(user: @usuario).comprobante.deliver_now
        end
        redirect_to turnos_path
    end    
end
