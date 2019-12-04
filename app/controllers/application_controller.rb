class ApplicationController < ActionController::Base

    def login
        session[:user] = nil
    end

    def home
    end
end
