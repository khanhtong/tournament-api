require 'csv'

class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :update, :destroy]

  def index
    @tournaments = Tournament.all
    json_response(@tournaments)
  end

  def create
    @tournament = Tournament.create!(tournament_params)
    json_response(@tournament, :created)
  end

  def show
    #json_response(@tournament)
    render json: {data: @tournament, groups: @tournament.groups}
  end

  def update
    @tournament.update(tournament_params)
    head :no_content
  end

  def destroy
    @tournament.destroy
    head :no_content
  end

  def import_data
    @data = CSV.read(params[:file].path)
    @tournament = Tournament.create(:name => params[:name])
    @data.each_with_index {|row, index|
      if index >= 1 && row[0]
        @group = Group.find_by name: row[1]
        # create new group
        if !@group
          @group = Group.create(:name => row[1], :tournament_id => @tournament.id)
        end

        # create player info
        @player_1_info = PlayerInfo.find_by name: row[3]
        if !@player_1_info
          @player_1_info = PlayerInfo.create(:name => row[3])
        end

        # create player in group
        @player1 = @group.players.find_by player_info_id: @player_1_info.id
        if !@player1
          @player1 = Player.create(:score => 0, :group_id => @group.id, :player_info_id => @player_1_info.id)
        end

        @player_2_info = PlayerInfo.find_by name: row[4]
        if !@player_2_info
          @player_2_info = PlayerInfo.create(:name => row[4])
        end

        @player2 = @group.players.find_by player_info_id: @player_2_info.id
        if !@player2
          @player2 = Player.create(:score => 0, :group_id => @group.id, :player_info_id => @player_2_info.id)
        end

        #check score
        string = row[8]
        if string.include? '-'
          puts string.class
          array = string.split('-')
          if array[0].to_i > array[1].to_i
            score_player1 = 3
            score_player2 = 0
          else
            if array[0].to_i == array[1].to_i
              score_player1 = 1
              score_player2 = 1
            else
              score_player1 = 3
              score_player2 = 0
            end
          end
          is_give_up = 0
        else
          if string.include? @player_1_info.name
            score_player1 = 0
            score_player2 = 3
          else
            score_player1 = 3
            score_player2 = 0
          end
          is_give_up = 1
        end
        # save score
        @player1.update(score: @player1.score + score_player1)
        @player2.update(score: @player2.score + score_player2)

        @match = Match.create(
            :venue => row[7],
            :group_id => @group.id,
            :name => row[2],
            :score_player1 => score_player1,
            :score_player2 => score_player2,
            :player1_id => @player_1_info.id,
            :player2_id => @player_2_info.id,
            :is_give_up => is_give_up
        )

      end
    }
    render json: {ok: 'done'}
  end


  private

  def tournament_params
    # whitelist params
    params.permit(:name)
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
