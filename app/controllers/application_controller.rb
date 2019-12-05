class ApplicationController < ActionController::Base
    layout "top_bar", :except => :login
    before_action :require_login
    skip_before_action :require_login, only: [:login]

    def login
        session[:user_id] = nil
    end

    def home
        @about = File.open('storage/about_us.txt').read
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
