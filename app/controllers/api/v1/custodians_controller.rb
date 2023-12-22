module Api
  module V1
    class CustodiansController < ApplicationController
      before_action :set_custodian, only: %i[show update destroy]

      def index
        custodians = Custodian.all

        render json: Panko::ArraySerializer.new(
          custodians, each_serializer: CustodianSerializer
        ).to_json
      end

      def show
        render json: { custodian: custodian_serializer(@custodian) }
      end

      def create
        @custodian = Custodian.new(custodian_params)

        if @custodian.save
          render json: { custodian: custodian_serializer(@custodian) }, status: :accepted
        else
          render json: { errors: @custodian.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @custodian.update(custodian_params)
          render json: { custodian: custodian_serializer(@custodian) }
        else
          render json: { errors: @custodian.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @custodian.destroy
          render json: { message: 'custodian deleted successfully' }
        else
          render json: { errors: @custodian.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_custodian
        @custodian = Custodian.find(params[:id])
      end

      def custodian_params
        params.require(:custodian).permit(*Custodian::WHITELISTED_ATTRIBUTES)
      end

      def custodian_serializer(custodian)
        Rails.cache.fetch([cache_key(custodian), I18n.locale]) do
          CustodianSerializer.new.serialize(custodian)
        rescue StandardError => e
          Rails.logger.error "Error serializing custodian #{custodian.id}: #{e.message}"
          {}.as_json
        end
      end

      def cache_key(custodian)
        "custodians/#{custodian.id}"
      end
    end
  end
end
