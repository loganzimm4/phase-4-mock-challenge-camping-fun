class CampersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with :not_found
resuce_from ActiveRecord::RecordInvalid, with :invalid

    def index 
        campers = Camper.all 
        render json: campers, status: :ok
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, status: 200
    end 

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :ok
    end

    private 

    def camper_params 
        params.permit(:name, :age)
    end

    def not_found 
        render json: {error: "Camper not found"}
    end 

    def invalid 
        render json: {errors: "validation errors"}
    end
end
