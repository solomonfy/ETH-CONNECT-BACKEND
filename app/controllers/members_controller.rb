class MembersController < ApplicationController
    before_action :set_member, only: [:show, :update, :destroy]
    wrap_parameters :member, include: [:first_name, :last_name, :username, :email, :password, :image, :family_size, :address]
    # skip_before_action :logged_in?, only: [:create]

  # GET /members
  def index
    @members = Member.all
    render json: @members, except: [:password_digest]
  end

  # GET /members/1
  def show
    # byebug
    render json: @member, except: [:password_digest, :created_at, :updated_at],
    # include: [:hosting_events => {except: [:host_id, :created_at, :updated_at]}]
    include: [:received_invitations => {include: [:event => {include: [:host => {except: [:password_digest, :created_at, :updated_at]}]}]}],
    include: [:announcements => {include: [:member => {only: [:first_name, :last_name]}]}]
  end

  # POST /members
  def create
    # byebug
    member = Member.new(member_params)

    if member.valid?
      member.save
      render json: member, except: [:password_digest, :created_at, :updated_at],
      status: :created, location: member
    else
      render json: member.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /members/1
  def update
    # byebug
    # if @member.valid?
      @member.update(
        first_name: params[:member][:first_name], 
        last_name: params[:member][:last_name], 
        username: params[:member][:username], 
        email: params[:member][:email], 
        image: params[:member][:image], 
        family_size: params[:member][:family_size], 
        address: params[:member][:address]
        # active: params[:member][:actions]

      )
      render json: @member, except: [:password_digest]
    # else
    #   render json: @member.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /members/1
  def destroy
    member_events = @member.hosting_events
    member_invitations = @member.received_invitations
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      # byebug
      params.require(:member).permit(
        :first_name, 
        :last_name, 
        :username, 
        :email, 
        :password, 
        :image, 
        :family_size, 
        :address)

    end


end
