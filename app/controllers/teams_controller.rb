class TeamsController < ApplicationController

  def index
    teams = Team.joins(pokemons: [:pokemon_template]).all
    teams = teams.search_by(team_filter_params) if team_filter_params.present?
    teams = teams.search_pokemon_by(pokemon_filter_param) unless pokemon_filter_param&.empty?
    
    render json: TeamBlueprint.render(teams.distinct, view: view_param)
  end

  def show
    render json: TeamBlueprint.render(team, view: :detailed)
  end

  def create
    team = Team.create(team_params)

    render json: TeamBlueprint.render(team, view: :detailed), status: :created
  end
  
  def update
    team.update(team_params)

    render json: TeamBlueprint.render(team, view: :simple)
  end
  
  def destroy
    team.destroy
    
    render json: TeamBlueprint.render(Team.all)
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

  def team
    @team ||= Team.find(params[:id])
  end

  def view_param
    permited = %w[detailed simple]
    
    params[:view].to_sym if permited.include?(params[:view])
  end

  def team_filter_params
    params.dig(:team, :name)
  end

  def pokemon_filter_param
    params.fetch(:pokemon, {}).slice(:nickname, :nature, :gender, :moves, :move, :types, :type)
  end
end