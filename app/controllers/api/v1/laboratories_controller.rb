module Api
  module V1
    class LaboratoriesController < ApplicationController
      before_action :set_laboratory, only: %i[show update destroy]

      def index
        laboratories = Laboratory.all

        render json: Panko::ArraySerializer.new(
          laboratories, each_serializer: LaboratorySerializer
        ).to_json
      end

      def show
        render json: { laboratory: laboratory_serializer(@laboratory) }
      end

      def create
        @laboratory = Laboratory.new(laboratory_params)

        if @laboratory.save
          render json: { laboratory: laboratory_serializer(@laboratory) }, status: :accepted
        else
          render json: { errors: @laboratory.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @laboratory.update(laboratory_params)
          render json: { laboratory: laboratory_serializer(@laboratory) }
        else
          render json: { errors: @laboratory.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @laboratory.destroy
          render json: { message: 'Laboratory deleted successfully' }
        else
          render json: { errors: @laboratory.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_laboratory
        @laboratory = Laboratory.find(params[:id])
      end

      def laboratory_params
        params.require(:laboratory).permit(*Laboratory::WHITELISTED_ATTRIBUTES)
      end

      def laboratory_serializer(laboratory)
        Rails.cache.fetch([cache_key(laboratory), I18n.locale]) do
          LaboratorySerializer.new.serialize(laboratory)
        rescue StandardError => e
          Rails.logger.error "Error serializing laboratory #{laboratory.id}: #{e.message}"
          {}.as_json
        end
      end

      def cache_key(laboratory)
        "laboratorys/#{laboratory.id}"
      end
    end
  end
end
