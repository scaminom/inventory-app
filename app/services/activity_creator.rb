class ActivityCreator
  def initialize(current_user, suggestion_id)
    @suggestion_id = suggestion_id
    @current_user = current_user
  end

  def call
    change_suggestion_status
    Activity.new(suggestion_id: @suggestion_id, message: 'Sugerencia atendida', actor_type: 'User',
                 actor_id: @current_user.id)
  end

  private

  def change_suggestion_status
    suggestion = Suggestion.find(@suggestion_id)
    raise 'La sugerencia ya fue atendida' if suggestion.status == 'closed'

    suggestion.status = 'closed'
    suggestion.save
  end
end
