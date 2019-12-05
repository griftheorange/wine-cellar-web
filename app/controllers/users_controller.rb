class UsersController < ApplicationController
    layout "top_bar", :except => :new
    skip_before_action :require_login, only: [:new, :create]
    
    def login
        @user = User.find_by(username: p[:username])
        if @user
            if @user.authenticate(p[:password])
                success_log(@user)
            else 
                flash[:no_match] = "Invalid Password"
                redirect_to app_login_path
            end
        else
            flash[:no_match] = "We can't find a match for that username, try making an account!"
            redirect_to app_login_path
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: p[:username])
        if !@user
            @user = User.create(p)
            if @user.valid?
                success_log(@user)
            else
                !@user.errors.messages[:username].empty? ? flash[:create]=@user.errors.messages[:username][0] : flash[:create]=@user.errors.messages[:password][0]
                redirect_to new_user_path
            end
        else
            flash[:create] = "That username already exists, get more creative."
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def success_log(user)
        session[:user_id] = user.id
        redirect_to app_home_path
    end

    private

    def p
        params.require(:user).permit(:username, :password)
    end
end
