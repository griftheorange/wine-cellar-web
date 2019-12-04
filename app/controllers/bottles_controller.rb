class BottlesController < ApplicationController

    def show
        @bottle = Bottle.find(params[:id])
    end

    def search
       @attribute = params.require(:bottle).permit(:attribute)[:attribute]
    end

end
