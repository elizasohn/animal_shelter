require 'rails_helper'

describe 'GET /animals', :type => :request do
    before { get '/animals' }

    it 'returns all animals' do
        expect(JSON.parse(response.body).size).to eq 40
    end
    it 'returns status code 200' do
        expect(response).to have_http_status 200
    end
end
