class MembersController < ApplicationController
    before_action :set_member, only: [:show, :update, :destroy]

    wrap_parameters :member, include: [:first_name, :last_name, :username, :email, :password, :image, :family_size, :address]

    # skip_before_action :logged_in?, only: [:index, :show, :create]

  # GET /members
  def index
    @members = Member.all
    render json: @members, except: [:password_digest]
  end

  # GET /members/1
  def show
    render json: @member, except: [:password_digest, :created_at, :updated_at],
    include: [:hosting_events, :received_invitations]
  end

  # POST /members
  def create
    # byebug
    member = Member.new(member_params)

    if member.save
      render json: member, status: :created, location: member
    else
      render json: member.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
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
