class SignupsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with :not_found

    def index 
        signups = Signup.all 
        render json: signups, status: :ok
    end

    def show 
        signup = Signup.find(params[:id])
        render json: signup, status: 200
    end 

    def create 
        signup = Signup.create!(signup_params)
        render json: signup, status: :ok
    end

    private

    def not_found
        render json: {error: "Signup not found"}
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
