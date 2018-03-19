class GroupsController < ApplicationController
  before_action :set_tournament
  before_action :set_tournament_group, only: [:show]

  def index
    @groups = @tournament.groups
    json_response(@groups)
  end

  def show
    json_response(@group)
  end

  def create
    puts @tournament
    @tournament.groups.create(group_params)
    json_response(@tournament, :created)
  end

  def group_params
    params.permit( :name, :tournament_id)
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_tournament_group
    @group = @tournament.groups.find_by(id: params[:id]) if @tournament
  end
end
