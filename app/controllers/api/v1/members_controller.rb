class Api::V1::MembersController < ApplicationController

    before_action :find_member, only: [:show, :update, :destroy]
    skip_before_action :logged_in?, only: [:index, :show, :create]



    def index
        @members = Member.all
        render json: @members, except: [:password_digest]
    end

    def show
        render json: @member, 
        except: [:password_digest, :created_at, :updated_at],
        methods: [:all_invitations_i_made, :all_events_am_invited_to],
        include: [:announcements => {only: [:description]}]

        # methods: [:all_invitations_i_made => {only: [:attendee_id]}, :all_events_am_invited_to]

        # render json: @question, include: [:answers => {only: [:body, :user_id]}, :user => {only: [:username, :image, :id]} ]

    end

    private

    def find_member
        @member = Member.find_by(id: params[:id])
    end
end
