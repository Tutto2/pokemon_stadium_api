class MovesController < ApplicationController
  def index
    render json: MoveBlueprint.render(Move.all)
  end

  def show
    render json: MoveBlueprint.render(move)
  end

  def create
    move = Move.create(move_params)

    render json: MoveBlueprint.render(move), status: :created
  end
  
  def update
    move.update(move_params)

    render json: MoveBlueprint.render(move)
  end
  
  def destroy
    move.destroy
    
    render json: MoveBlueprint.render(Move.all)
  end

  private
  def move_params
    params.require(:move).permit(:name)
  end

  def move
    @move ||= Move.find(params[:id])
  end
end