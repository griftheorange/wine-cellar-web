class ApplicationController < ActionController::Base
    layout "top_bar", :except => :login
    before_action :require_login
    skip_before_action :require_login, only: [:login]

    def login
        session[:user_id] = nil
    end

    def home
    end

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
