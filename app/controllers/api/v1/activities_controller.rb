module Api
  module V1
    class ActivitiesController < ApplicationController
      before_action :set_activity, only: %i[ show update destroy ]

    
      def index
        activities = Activity.all

        render json: Panko::ArraySerializer.new(
          activities, each_serializer: ActivitySerializer
        ).to_json
      end

  
      def show
        render json: { activity: activity_serializer(@activity) }
      end

    
      def create
        @activity = Activity.new(activity_params)

        if @activity.save
          render json: { activity: activity_serializer(@activity) }, status: :created, location: @activity
        else
          render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
        end
      end

    
      def update
        if @activity.update(activity_params)
         render json: { activity: activity_serializer(@activity) }
        else
          render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
        end
      end

  
      def destroy
        if @activity.destroy
          render json: { message: 'Activity deleted successfully' }
        else
          render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

     def set_activity
        @activity = Activity.find(params[:id])
      end

   
      def activity_params
        params.require(:activity).permit(:description, :status, :suggestion_id)
      end

      def activity_serializer(activity)
        Rails.cache.fetch([cache_key(activity), I18n.locale]) do
          ActivitySerializer.new.serialize(activity)
        rescue StandardError => e
          Rails.logger.error "Error serializing activity #{activity.id}: #{e.message}"
          {}.as_json
        end
      end

      def cache_key(activity)
        "activities/#{activity.id}"
      end
    end
  end
end 