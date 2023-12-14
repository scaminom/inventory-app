module Api
  module V1
    class LaboratoriesController < ApplicationController
      before_action :set_laboratory, only: %i[show update destroy]

      def index
        @laboratories = Laboratory.all

        render json: @laboratories
      end

      def show
        render json: @laboratory
      end

      def create
        @laboratory = Laboratory.new(laboratory_params)

        if @laboratory.save
          render json: @laboratory, status: :created, location: @laboratory
        else
          render json: @laboratory.errors, status: :unprocessable_entity
        end
      end

      def update
        if @laboratory.update(laboratory_params)
          render json: @laboratory
        else
          render json: @laboratory.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @laboratory.destroy!
      end

      private

      def set_laboratory
        @laboratory = Laboratory.find(params[:id])
      end

      def laboratory_params
        params.require(:laboratory).permit(:name, :description)
      end
    end
  end
end
