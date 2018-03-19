class PlayerInfosController < ApplicationController
  before_action :set_player_info, only: [:show]

  def index
    @player_infos = PlayerInfo.all
    json_response(@player_infos)
  end

  def show
    render json: {data: @player_info, tournaments: @player_info.players}
  end

  def set_player_info
    @player_info = PlayerInfo.find(params[:id])
  end
end
