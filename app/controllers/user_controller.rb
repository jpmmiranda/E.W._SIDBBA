class UserController < ApplicationController
  
    def index
        @users = User.all
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
