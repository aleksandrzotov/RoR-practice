class Api::V1::ReactionsController < Api::ApplicationController
  protect_from_forgery with: :null_session
  before_action :authorize_request

  def create
    form = Api::V1::Reaction::CreateForm.new(params)
    reaction = Reaction.create(form.params.merge(user: @current_user))

    if reaction
      render json: reaction, serializer: ReactionSerializer, status: :created
    else
      render json: { errors: reaction.errors.full_messages },
        status: :unprocessable_entity
    end
  end
end
