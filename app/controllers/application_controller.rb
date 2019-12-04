class ApplicationController < ActionController::Base
    layout "top_bar", :except => :login

    def login
        session[:user] = nil
    end

    def home
    end
end
