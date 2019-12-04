class StashesController < ApplicationController
    def new
        @cellar = Cellar.find(params[:id])
        @stash = Stash.new
    end
end
