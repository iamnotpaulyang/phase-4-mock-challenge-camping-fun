class ActivitiesController < ApplicationController

    def index
        render json: Activity.all, status: :ok
    end

    def destroy
        find_activity.destroy
        head :no_content
    end

private

    def find_activity
        Activity.find(params[:id])
    end
end
