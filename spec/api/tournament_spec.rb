require 'rails_helper'

RSpec.describe 'Tournament API' do
  let!(:tournaments) {create_list(:tournament, 10)}
  let!(:tournament_id) {tournaments.first.id}

  describe 'POST /import-data' do
    let(:csv_file) {Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/tournament 9 ball.csv"))}
    let(:request) {
      {file: csv_file,
       name: 'test tournament'
      }
    }
    before {post "/import-data", params: request}
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tournaments' do
    before {get '/tournaments'}

    it 'returns tournaments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tournaments/:id' do
    before {get "/tournaments/#{tournament_id}"}
    it 'returns the tournaments' do
      expect(json['data']).not_to be_empty
      expect(json['data']['id']).to eq(tournament_id)
    end
  end

end