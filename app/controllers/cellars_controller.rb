class CellarsController < ApplicationController
    def index
        @user = User.find(session[:user])
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
        if @cellar.valid?
            @cellar = Cellar.find(params[:id])
            @cellar.update(p)
            redirect_to @cellar
        else
            flash[:cellar] = @cellar.errors.messages.first[1][0]
            @cellar = Cellar.find(params[:id])
            render :new
        end
    end

    private

    def p
        p = params.require(:cellar).permit(:name, :description)
        p[:user_id] = session[:user]
        p
    end
end
