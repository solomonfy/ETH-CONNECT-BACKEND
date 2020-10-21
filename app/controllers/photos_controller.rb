class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]
  # skip_before_action :logged_in?, only: [:index, :show]


  # GET /photos
  def index
    @photos = Photo.all

    render json: @photos, include: [:event => {only: [:name]}]
  end

  # GET /photos/1
  def show
    render json: @photo, include: [:event => {only: [:name]}]
  end

  # POST /photos
  def create
    # byebug
    @photo = Photo.new(photo_params)

    if @photo.valid?
    @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:src, :event_id, :member_id)
    end
end
