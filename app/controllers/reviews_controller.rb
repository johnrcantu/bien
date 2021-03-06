class ReviewsController < ApplicationController

  def index
    # this is our list page for our reviews

    @number = rand(100)

    @reviews = Review.all

  end

  def new
    # the form for adding a new review
    @review = Review.new
  end

  def create
    # take info from form and add to database
    @review = Review.new(form_params)

    # we want to check if the model can be saved
    # if it is, we're going to the homepage again
    # if it isn't, show the new form
    if @review.save
      redirect_to root_path
    else
      # show the view for new.html.erb
      render "new"
    end

  end

  def show
    # individual review page
    @review = Review.find(params[:id])
  end

  def destroy
    # find individual review
    @review = Review.find(params[:id])

    # destroy
    @review.destroy

    #redirect to homepage
    redirect_to root_path
  end

  def edit
    # find individual review to edit
    @review = Review.find(params[:id])
  end

  def update
    # find individual review
    @review = Review.find(params[:id])

    # update with new info
    if @review.update(form_params)

      # redirect to somewhere new
      redirect_to review_path(@review)
    else
      render "edit"
    end
  end

  def form_params
    params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance)
  end

end
