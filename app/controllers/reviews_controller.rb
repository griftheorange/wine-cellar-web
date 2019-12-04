class ReviewsController < ApplicationController
    layout "top_bar"

    def index
        @user = User.find(session[:user])
        @reviews = @user.reviews 
    end
    
    
    def show
        @review = Review.find(params[:id])
    end
    
    def new
        @user = User.find(session[:user])
        @review = Review.new
    end

    def create

        @review = Review.create(review_params)
    
        redirect_to reviews_path
    end
    
    def destroy
        Review.find_by(review_params).destroy
        redirect_to reviews
    end
    private

    def review_params
       params.require(:review).permit(:content,:rating,:bottle_id, :user_id) 
    end
end
