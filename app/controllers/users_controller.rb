class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.where(user: current_user)
    end

end
