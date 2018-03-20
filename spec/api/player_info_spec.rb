require 'rails_helper'

RSpec.describe 'Player Info API' do
  let!(:playerInfos) {create_list(:playerInfo, 10)}
  let!(:playerInfo_id) {playerInfos.first.id}

  describe 'GET /player_infos' do
    before {get '/player_infos'}

    it 'returns player_infos' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /player_infos/:id' do
    before {get "/player_infos/#{playerInfo_id}"}
    it 'returns the tournaments' do
      expect(json['data']).not_to be_empty
      expect(json['data']['id']).to eq(playerInfo_id)
    end
  end

end