class UsersController < ApplicationController
    def login
        @user = User.find_by(p)
        if @user
            success_log(@user)
        else
            flash[:no_match] = "There is no username/password matching that input! Stop drinking so much!"
            redirect_to home_login_path
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: p[:username])
        if !@user
            @user = User.create(p)
            success_log(@user)
        else
            flash[:already_exists] = "That username already exists, get more creative."
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def success_log(user)
        session[:user] = user.username
        redirect_to app_home_path
    end

    private

    def p
        params.require(:user).permit(:username, :password)
    end
end
