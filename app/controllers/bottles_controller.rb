class BottlesController < ApplicationController

    def show
        @bottle = Bottle.find(params[:id])
    end

end
