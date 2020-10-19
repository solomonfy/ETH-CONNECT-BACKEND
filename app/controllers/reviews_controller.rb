class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  skip_before_action :logged_in?, only: [:index, :show]


  # GET /reviews
  def index
    @reviews = Review.all
    render json: @reviews, include: [:attendee => {only: [:first_name, :last_name]}]
  end

  # GET /reviews/1
  def show
    render json: @review, include: [:attendee => {only: [:first_name, :last_name]}]
  end

  # POST /reviews
  def create
    # byebug
    @review = Review.new(
      description: params[:review][:description],
      event_id: params[:review][:event_id],
      attendee_id: @member.id
    )
    if @review.valid? 
      @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:description, :attendee_id, :event_id, :likes)
    end
end
