module Api
  module V1
class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[ show update destroy ]


  def index
    suggestions = Suggestion.all

    render json: Panko::ArraySerializer.new(
      suggestions, each_serializer: SuggestionSerializer
    ).to_json
  end

  
  def show
    render json: { suggestion: suggestion_serializer(@suggestion) }
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      render json: { suggestion: suggestion_serializer(@suggestion) }, status: :accepted
    else
      render json: { errors: @suggestion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @suggestion.update(suggestion_params)
      render json: { suggestion: suggestion_serializer(@suggestion) }
    else
      render json: { errors: @suggestion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @suggestion.destroy
      render json: { message: 'Suggestion deleted successfully' }
    else
      render json: { errors: @suggestion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:title, :description)
  end

  def suggestion_serializer(suggestion)
    Rails.cache.fetch([cache_key(suggestion), I18n.locale]) do
      SuggestionSerializer.new.serialize(suggestion)
    rescue StandardError => e
      Rails.logger.error "Error serializing suggestion #{suggestion.id}: #{e.message}"
      {}.as_json
    end
  end

  def cache_key(suggestion)
    "suggestions/#{suggestion.id}"
  end
  
  end
  end
end
