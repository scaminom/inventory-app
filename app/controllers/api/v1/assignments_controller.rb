module Api
  module V1
    class AssignmentsController < ApplicationController
      before_action :set_assignment, only: %i[show destroy update]

      def index
        assignments = Assignment.all

        render json: Panko::ArraySerializer.new(
          assignments, each_serializer: AssignmentSerializer
        ).to_json
      end

      def show
        render json: { assignment: assignment_serializer(@assignment) }
      end

      def create
        @assignment = Assignment.new(assignment_params)

        if @assignment.save
          render json: { assignment: assignment_serializer(@assignment) }, status: :accepted
        else
          render json: { errors: @assignment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @assignment.update(assignment_params)
          render json: { assignment: assignment_serializer(@assignment) }
        else
          render json: { errors: @assignment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @assignment.destroy
          render json: { message: 'assignment deleted successfully' }
        else
          render json: { errors: @assignment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_assignment
        @assignment = Assignment.find(params[:id])
      end

      def assignment_params
        params.require(:assignment).permit(*Assignment::WHITELISTED_ATTRIBUTES)
      end

      def assignment_serializer(assignment)
        Rails.cache.fetch([cache_key(assignment), I18n.locale]) do
          AssignmentSerializer.new.serialize(assignment)
        rescue StandardError => e
          Rails.logger.error "Error serializing assignment #{assignment.id}: #{e.message}"
          {}.as_json
        end
      end

      def cache_key(assignment)
        "assignments/#{assignment.id}"
      end
    end
  end
end
