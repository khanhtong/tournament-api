class MatchesController < ApplicationController
  before_action :set_tournament
  before_action :set_tournament_group
  before_action :set_match, only: [:show, :create]

  def show
    json_response(@match)
  end

  def create
    # find player name
    @player1_info = PlayerInfo.find_by name: params[:player1_name]
    @player2_info = PlayerInfo.find_by name: params[:player2_name]
    save_score
    @match = Match.create(
        :venue => params[:venue],
        :group_id => @group.id,
        :name => params[:name],
        :score_player1 => params[:score_player1],
        :score_player2 => params[:score_player2],
        :player1_id => @player1_info.id,
        :player2_id => @player2_info.id,
        :is_give_up => 0
        )
    json_response(@match, :created)
  end

  def save_score
    # find player info in each tournament to save score
    @player1 = @group.players.find_by(id: @player1_info.id)
    @player2 = @group.players.find_by(id: @player2_info.id)
    # @player1.score = @player1.score + params[:score_player1].to_i
    # @player2.score = @player2.score + params[:score_player2].to_i
    @player1.update(score: @player1.score + params[:score_player1].to_i )
    @player2.update(score: @player2.score + params[:score_player2].to_i)
  end

  def index
    @matches = @group.matches
    json_response(@matches)
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_tournament_group
    @group = @tournament.groups.find_by(id: params[:group_id]) if @tournament
  end

  def set_match
    @match = @group.matches.find_by(id: params[:id]) if @group
  end

end
