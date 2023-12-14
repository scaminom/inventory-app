module Api
  module V1
    class PeripheralsController < ApplicationController
      before_action :set_peripheral, only: %i[show update destroy]

      def index
        peripherals = Peripheral.all

        render json: Panko::ArraySerializer.new(
          peripherals, each_serializer: PeripheralSerializer
        ).to_json
      end

      def show
        render json: { peripheral: peripheral_serializer(@peripheral) }
      end

      def create
        @peripheral = Peripheral.new(peripheral_params)

        if @peripheral.save
          render json: { peripheral: peripheral_serializer(@peripheral) }, status: :accepted
        else
          render json: { errors: @peripheral.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @peripheral.update(peripheral_params)
          render json: { peripheral: peripheral_serializer(@peripheral) }
        else
          render json: { errors: @peripheral.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @peripheral.destroy
          render json: { message: 'peripheral deleted successfully' }
        else
          render json: { errors: @peripheral.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_peripheral
        @peripheral = Peripheral.find(params[:id])
      end

      def peripheral_params
        params.require(:peripheral).permit(*Peripheral::WHITELISTED_ATTRIBUTES)
      end

      def peripheral_serializer(peripheral)
        Rails.cache.fetch([cache_key(peripheral), I18n.locale]) do
          PeripheralSerializer.new.serialize(peripheral)
        rescue StandardError => e
          Rails.logger.error "Error serializing peripheral #{peripheral.id}: #{e.message}"
          {}.as_json
        end
      end

      def cache_key(peripheral)
        "peripherals/#{peripheral.id}"
      end
    end
  end
end
