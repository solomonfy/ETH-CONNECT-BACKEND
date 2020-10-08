class ApplicationController < ActionController::API

    before_action :logged_in?
    
    def encode_token(payload)
        JWT.encode(payload, "ourcommunity")
    end

    def logged_in?
        # byebug
        headers = request.headers["Authorization"]
        token = headers.split(" ")[1]

        begin
            member_id = JWT.decode(token, "ourcommunity")[0]["member_id"]
            @member = Member.find_by(id: member_id)
        rescue 
            @member = nil
        end

        unless @member
            render json: {error: "Please Login!"}
        end 
    end
end
