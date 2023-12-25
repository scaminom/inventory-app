module Api
  module V1
    class TechnicianController < ApplicationController
      def create_activity
        activity = ActivityCreator.new(current_user, permitted_params[:suggestion_id]).call
        if activity.save
          render json: { activity: ActivitySerializer.new.serialize(activity).to_json }, status: :accepted
        else
          render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.require(:activity).permit(*Activity::WHITELISTED_ATTRIBUTES)
      end
    end
  end
end
