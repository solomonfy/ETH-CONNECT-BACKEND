class AuthController < ApplicationController

    skip_before_action :logged_in?, only: [:create]


    def create
        # byebug
        member = Member.find_by(username: params[:member][:username]) 
        # get the member by username
        
        # member.authenticate(params[:member][:password])       // check if password is matching 
        if member && member.authenticate(params[:member][:password])
        # byebug
        
        

            render json: {id: member.id, 
                image: member.image, 
                email: member.email, 
                first_name: member.first_name, 
                last_name: member.last_name, 
                address: member.address, 
                family_size: member.family_size, 
                token: encode_token({member_id: member.id})}, status: 200
        else
            render json: {error: "Invalid username or password"}
        end
    end
end
