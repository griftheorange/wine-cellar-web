class CellarsController < ApplicationController
    layout "top_bar"

    def index
        @user = User.find(session[:user_id])
        @cellars = @user.cellars
    end

    def new
        @cellar = Cellar.new
    end

    def create
        @cellar = Cellar.create(p)
        if @cellar.valid?
            redirect_to cellars_path
        else
            flash[:cellar] = @cellar.errors.messages.first[1][0]
            redirect_to new_cellar_path
        end
    end

    def show
        @cellar = Cellar.find(params[:id])
        @bottles = @cellar.bottles
    end

    def destroy
        Cellar.find(params[:id]).destroy
        redirect_to cellars_path
    end

    def edit
        @cellar = Cellar.find(params[:id])
        render :new
    end

    def update
        @cellar = Cellar.new(p)
        @o_cellar = Cellar.find(params[:id])
        other_cellar_names = @o_cellar.user.cellars.map{|cellar| cellar.name}
        other_cellar_names.delete(@o_cellar.name)

        if @cellar.name == nil || other_cellar_names.include?(@cellar.name)
            flash[:cellar] = "You need a uniq name for your cellar."
            redirect_to edit_cellar_path
        elsif @cellar.description == ""
            flash[:cellar] = "You need a description for your cellar."
            redirect_to edit_cellar_path
        else
            @o_cellar.update(p)
            redirect_to @o_cellar
        end
    end

    private

    def p
        p = params.require(:cellar).permit(:name, :description)
        p[:user_id] = session[:user_id]
        p
    end
end
