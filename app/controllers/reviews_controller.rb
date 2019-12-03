class ReviewsController < ApplicationController
    def index
        @user = User.find(session[:user])
        @reviews = @user.reviews 
    end

    def show
        @user = User.find(session[:user])
        @review = Review.find(params[:id])
    end

    def new
        @review = Review.new(review_params)
    end
    def create
        review = Review.create(review_params)
        if review
        redirect_to reviews_path
        else
            redirect_to new_review_path
        end
    end
    
    private

    def review_params
       params.require(:reviews).permit(:content,:rating,:bottle_id,:user_id) 
    end
end
