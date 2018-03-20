require 'rails_helper'

RSpec.describe 'Player API' do
  let!(:tournament) {create(:tournament)}
  let!(:group) {create(:group, tournament_id: tournament.id)}
  let!(:player_info) {create(:playerInfo)}
  let(:tournament_id) {tournament.id}
  let(:group_id) {group.id}
  let(:player_info_id) {player_info.id}
  let!(:players) {create_list(:player, 10, {group_id: group.id, player_info_id: player_info_id})}

  let(:id) {players.first.id}

  describe 'GET /tournaments/:tournament_id/groups/:group_id/players' do
    before {get "/tournaments/#{tournament_id}/groups/#{group_id}/players"}

    it 'returns players' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tournaments/:tournament_id/groups/:group_id/players/:id' do
    before {get "/tournaments/#{tournament_id}/groups//#{group_id}/players/#{id}"}
    it 'returns the group' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(id)
    end
  end

end