# frozen_string_literal: true

class Api::V1::Reaction::CreateForm < Api::V1::ApplicationForm
  def initialize(params)
    @params = params
  end

  def params
    @params.require(:reaction).permit(:kind, :post_id)
  end
end
