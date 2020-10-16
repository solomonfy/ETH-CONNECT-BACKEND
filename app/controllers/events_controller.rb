class EventsController < ApplicationController

    before_action :set_event, only: [:show, :update, :destroy]
    # skip_before_action :logged_in?, only: [:index, :show]


    # GET /events
    def index
      @events = Event.all

      render json: @events, 
      except: [:created_at, :updated_at], 
      include: [:reviews, :host => {only: [:first_name, :last_name, :id]}]

    end
  
    # GET /events/1
    def show
      # render json: @event, except: [:created_at, :updated_at], include: [:host]
      render json: @event, 
      except: [:created_at, :updated_at], 
      include: [:reviews, :host => {only: [:first_name, :last_name, :id]}]

    end
  
    # POST /events
    def create
      # byebug
      @event = Event.new(
        name: params[:event][:name], 
        description: params[:event][:description], 
        location: params[:event][:location], 
        date: params[:event][:date], 
        event_type: params[:event][:event_type], 
        event_card: params[:event][:event_card], 
        summary: params[:event][:summary], 
        host_id: @member.id
      )
  
      if @event.valid?
        @event.save
        render json: @event, 
        # except: [:created_at, :updated_at], 
        include: [:host => {except: [:password_digest]}],
        status: :created, location: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /events/1
    def update
      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /events/1
    def destroy
      @event.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find_by(id: params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def event_params
        params.require(:event).permit(:host_id, :name, :description, :date, :location, :event_type, :summary)
      end
end


