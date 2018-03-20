require 'rails_helper'

RSpec.describe 'Group API' do
  let!(:tournament) {create(:tournament)}
  let!(:groups) { create_list(:group, 10, tournament_id: tournament.id) }
  let(:tournament_id) { tournament.id }

  let(:id) {groups.first.id}

  describe 'GET /tournaments/:tournament_id/groups' do
    before {get "/tournaments/#{tournament_id}/groups"}

    it 'returns groups' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tournaments/:tournament_id/groups/:id' do
    before {get "/tournaments/#{tournament_id}/groups/#{id}"}
    it 'returns the group' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(id)
    end
  end

end