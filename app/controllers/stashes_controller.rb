class StashesController < ApplicationController
    layout "top_bar"
    skip_before_action :verify_authenticity_token, :only => [:destroy]

    def new
        @cellar = Cellar.find(params[:id])
        @stash = Stash.new
    end

    def create
        Stash.find_or_create_by(p)
        redirect_to cellar_path(p[:cellar_id])
    end

    def remove
        @cellar = Cellar.find(params[:id])
    end

    def destroy
        Stash.find_by(p).destroy
        redirect_to cellar_path(p[:cellar_id])
    end

    private

    def p
        params.require(:stash).permit(:cellar_id, :bottle_id)
    end
end
