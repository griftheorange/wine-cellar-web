class ReviewsController < ApplicationController
    layout "top_bar"

    def index
        @user = User.find(session[:user_id])
        @reviews = @user.reviews 
    end
    
    
    def show
        @review = Review.find(params[:id])
    end
    
    def new
        if params[:select]
            flash[:select] = params[:select]
            @user = User.find(session[:user_id])
            @review = Review.new
        else
            flash[:select] = nil
            @user = User.find(session[:user_id])
            @review = Review.new
        end
    end

    def create

        @review = Review.create(review_params)
        if @review.valid?
            redirect_to reviews_path
        else
            flash[:review] = @review.errors.messages.first[1][0]
            redirect_to new_review_path
        end
    end
    
    def destroy
        Review.find_by(id: params[:id]).destroy
        redirect_to reviews_path
    end

    private

    def review_params
       params.require(:review).permit(:content,:rating,:bottle_id,:user_id) 
       
    end
end
