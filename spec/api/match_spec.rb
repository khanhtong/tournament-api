require 'rails_helper'

RSpec.describe 'Match API' do
  let!(:tournament) {create(:tournament)}
  let!(:group) {create(:group, tournament_id: tournament.id)}
  let(:tournament_id) {tournament.id}
  let(:group_id) {group.id}
  let(:player1_info) {create(:playerInfo)}
  let(:player2_info) {create(:playerInfo)}
  let!(:player1) {create(:player, {group_id: group.id, player_info_id: player1_info.id})}
  let!(:player2) {create(:player, {group_id: group.id, player_info_id: player2_info.id})}
  let!(:matches) {create_list(:match, 10, {group_id: group_id, player1_id: player1.id, player2_id: player2.id})}

  let(:id) {matches.first.id}

  describe 'GET /tournaments/:tournament_id/groups/:group_id/matches' do
    before {get "/tournaments/#{tournament_id}/groups/#{group_id}/matches"}

    it 'returns matches' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tournaments/:tournament_id/groups/:group_id/matches/:id' do
    before {get "/tournaments/#{tournament_id}/groups//#{group_id}/matches/#{id}"}
    it 'returns the group' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(id)
    end
  end

end