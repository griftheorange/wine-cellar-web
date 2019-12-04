class ReviewsController < ApplicationController
    layout "top_bar"

    def index
        @user = User.find(session[:user])
        @reviews = @user.reviews 
    end
    
    
    def show
        
        @review = Review.find(session[:user])
    end
    
    def new
        @review = Review.new
    end

    def create

        review = Review.create(review_params)
        redirect_to reviews_path
    end
    
    private

    def review_params
       params.require(:reviews).permit(:content,:rating,:bottle_id) 
    end
end
