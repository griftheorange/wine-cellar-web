class ApplicationController < ActionController::Base
    layout "top_bar", :except => [:login, :forgot]
    before_action :require_login
    skip_before_action :require_login, only: [:login, :forgot, :hint]

    def login
        session[:user_id] = nil
    end

    def forgot
    end

    def hint
        p = params.require(:user).permit(:username)
        u = User.find_by(username: p[:username])
        if u
            flash[:no_match] = "#{u.hint}"
        end
        redirect_to forgot_password_path
    end

    def home
    end

    def analytics
        @highest_rated_bottles = Bottle.highest_rated
        @most_reviewed_bottles = Bottle.most_reviewed
        @most_stashed_bottles = Bottle.most_cellars
        @average_cellar_size = Cellar.average_size
    end

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
