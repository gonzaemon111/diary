class NikkisController < ApplicationController
  before_action :set_nikki, only: %i[edit show update destroy]

  def index
    @nikkis = Nikki.order("created_at ASC")
    render :index, status: 200
  end

  def new
    @nikki = Nikki.new
  end

  def edit; end

  def show; end

  def create
    @nikki = Nikki.new(nikki_params)
    if @nikki.save
      push_messages(@nikki).execute
      render :show, status: 201
    else
      render json: @nikki.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @nikki.destroy
    render json: { id: params[:id].to_i }, status: 200
  end

  def update
    if @nikki.update(nikki_params)
      push_messages(@nikki)
      render :show, status: 204
    else
      render json: @nikki.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_nikki
    @nikki = Nikki.find(params[:id])
  end

  def nikki_params
    params.require(
      :nikki
    ).permit(
      :value,
      :datetime
    )
  end

  def push_messages(nikki)
    Api::Line::PushMessageUsecase.new(nikki)
  end
end
