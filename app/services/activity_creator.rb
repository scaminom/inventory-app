class ActivityCreator
  def initialize(current_user, activity_params)
    @current_user = current_user
    @activity_params = activity_params
  end

  def call
    change_suggestion_status
    Activity.new(suggestion_id: @activity_params[:suggestion_id], message: @activity_params[:message], actor_type: 'User',
                 actor_id: @current_user.id)
  end

  private

  def change_suggestion_status
    suggestion = Suggestion.find(@activity_params[:suggestion_id])
    raise 'La sugerencia ya fue atendida' if suggestion.status == 'closed'

    suggestion.status = 'closed'
    suggestion.save
  end
end
