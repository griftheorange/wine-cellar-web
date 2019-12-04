class BottlesController < ApplicationController

    layout "top_bar"

    def index
        if params[:search]
            @search = params.require(:bottle).permit(:attr, :specific_attr)
            @bottles = Bottle.where(" #{@search[:attr]} LIKE ? ", @search[:specific_attr])
            has_results(@bottles)
        else
            @search = nil
            @bottles = Bottle.all
        end
    end

    def show
        @bottle = Bottle.find(params[:id])
    end

    def search
        if params[:name] == ""
            @attribute = params.require(:bottle).permit(:attribute)[:attribute]
        else
            @search = {attr: params[:bottle][:attribute], specific_attr: params[:name]}
            @bottles = Bottle.where(" #{@search[:attr]} LIKE ? ", @search[:specific_attr])
            has_results(@bottles)
        end
    end

    def has_results(bots)
        if bots.empty?
            flash[:no_results] = "There are no bottles matching that search. If you don't know of any, try searching without anything in the text bar!"
            redirect_to app_home_path
        else
            render :index
        end
    end

end
