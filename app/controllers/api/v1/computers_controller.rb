module Api
  module V1
    class ComputersController < ApplicationController
      before_action :set_computer, only: %i[show update destroy]

      def index
        computers = Computer.all

        render json: Panko::ArraySerializer.new(
          computers, each_serializer: ComputerSerializer
        ).to_json
      end

      def show
        render json: { computer: computer_serializer(@computer) }
      end

      def create
        @computer = Computer.new(computer_params)

        if @computer.save
          render json: { computer: computer_serializer(@computer) }, status: :accepted
        else
          render json: { errors: @computer.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @computer.update(computer_params)
          render json: { computer: computer_serializer(@computer) }
        else
          render json: { errors: @computer.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @computer.destroy
          render json: { message: 'Computer deleted successfully' }
        else
          render json: { errors: @computer.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_computer
        @computer = Computer.find(params[:id])
      end

      def computer_params
        params.require(:computer).permit(*Computer::WHITELISTED_ATTRIBUTES)
      end

      def computer_serializer(computer)
        Rails.cache.fetch([cache_key(computer), I18n.locale]) do
          ComputerSerializer.new.serialize(computer)
        rescue StandardError => e
          Rails.logger.error "Error serializing computer #{computer.id}: #{e.message}"
          {}.as_json
        end
      end

      def cache_key(computer)
        "computers/#{computer.id}"
      end
    end
  end
end
