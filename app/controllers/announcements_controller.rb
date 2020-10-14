class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :update, :destroy]
  skip_before_action :logged_in?, only: [:index, :show]


  # GET /announcements
  def index
    # byebug
    @announcements = Announcement.all
    render json: @announcements, include: [:member => {only: [:first_name, :last_name, :id]}]
  end

  # GET /announcements/1
  def show
    render json: @announcement, include: [:member => {only: [:first_name, :last_name, :id]}]
  end

  # POST /announcements
  def create
    # byebug
    @announcement = Announcement.new(
      description: params[:announcement][:description],
      member_id: @member.id
    )

    if @announcement.save
      render json: @announcement, status: :created, location: @announcement
    else
      render json: @announcement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /announcements/1
  def update
    if @announcement.update(announcement_params)
      render json: @announcement
    else
      render json: @announcement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /announcements/1
  def destroy
    @announcement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def announcement_params
      params.require(:announcement).permit(:description, :member_id)
    end
end
