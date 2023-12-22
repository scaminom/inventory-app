module Api
  module V1
    class AssetsController < ApplicationController
      before_action :set_asset, only: %i[show destroy update]

      def index
        assets = Asset.all

        render json: Panko::ArraySerializer.new(
          assets, each_serializer: AssetSerializer
        ).to_json
      end

      def show
        render json: { asset: asset_serializer(@asset) }
      end

      def create
        @asset = Asset.new(asset_params)

        if @asset.save
          render json: { asset: asset_serializer(@asset) }, status: :accepted
        else
          render json: { errors: @asset.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @asset.update(asset_params)
          render json: { asset: asset_serializer(@asset) }
        else
          render json: { errors: @asset.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @asset.destroy
          render json: { message: 'asset deleted successfully' }
        else
          render json: { errors: @asset.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_asset
        @asset = Asset.find(params[:id])
      end

      def asset_params
        params.require(:asset).permit(*Asset::WHITELISTED_ATTRIBUTES)
      end

      def asset_serializer(asset)
        Rails.cache.fetch([cache_key(asset), I18n.locale]) do
          AssetSerializer.new.serialize(asset)
        rescue StandardError => e
          Rails.logger.error "Error serializing asset #{asset.id}: #{e.message}"
          {}.as_json
        end
      end

      def cache_key(asset)
        "assets/#{asset.id}"
      end
    end
  end
end
