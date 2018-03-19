class PlayersController < ApplicationController
  before_action :set_tournament
  before_action :set_tournament_group
  before_action :set_player, only: [:show, :create]

  def index
    @players = @group.players
    json_response(@players)
  end

  def show
    json_response(@player)
  end

  def create
    puts @group.id
    puts params[:name]

    @player_info = PlayerInfo.find_by name: params[:name]
    if @player_info
      puts 'have player'
    else
      # create new player_info then create player in group
      @player_info = PlayerInfo.create(params.permit(:name))
    end
    create_player
  end

  def create_player
    @player = Player.create(:score => 0, :group_id => @group.id, :player_info_id => @player_info.id)
    json_response(@player, :created)
  end

  def player_params
    params.permit(:score, :group_id, :tournament_id, :player_info_id)
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_tournament_group
    @group = @tournament.groups.find_by(id: params[:group_id]) if @tournament
  end

  def set_player
    @player = @group.players.find_by(id: params[:id]) if @group
  end
end