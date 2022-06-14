class ActivitiesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with :not_found

    def index 
        activities = Activity.all 
        render json: activities, status: :ok
    end

    def show 
        activity = Activity.find(params[:id])
        render json: activity, status: 200
    end

    def destroy 
        activity = Activity.find(params[:id])
        activity.destroy 
    end

    private

    def not_found 
        render json: {error: "Activity not found"}
    end
end
