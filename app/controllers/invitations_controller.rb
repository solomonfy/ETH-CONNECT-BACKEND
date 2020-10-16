class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy]
  skip_before_action :logged_in?, only: [:index, :show]


    # GET /invitations
    def index
      @invitations = Invitation.all

      render json: @invitations, except: [:created_at, :updated_at], 
      include: [:event => {include: [:host => {except: [:password_digest, :created_at, :updated_at]}]}]
    end
  
    # GET /invitations/1
    def show
      render json: @invitation, 
      except: [:created_at, :updated_at], 
      include: [:event => {include: [:host => {except: [:password_digest, :created_at, :updated_at]}]}]
      # render json: @invitation, except: [:created_at, :updated_at]
    end
  
    # POST /invitations
    def create
      # @invitation = Invitation.new(invitation_params)
      @invitation = Invitation.new(
        attendee_id: params[:invitation][:attendee_id],
        card: params[:invitation][:card],
        message: params[:invitation][:message],
        event_id: params[:invitation][:event_id]
      )
  
      if @invitation.save
        render json: @invitation, status: :created, location: @invitation
      else
        render json: @invitation.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /invitations/1
    def update
      if @invitation.update(invitation_params)
        render json: @invitation
      else
        render json: @invitation.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /invitations/1
    def destroy
      @invitation.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_invitation
        @invitation = Invitation.find_by(id: params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def invitation_params
        params.require(:invitation).permit(:attendee_id, :event_id)
      end

end
