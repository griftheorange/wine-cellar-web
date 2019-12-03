class UsersController < ApplicationController
    def login
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_or_create_by(p)
        redirect_to @user
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def p
        params.require(:user).permit(:username, :password)
    end
end
