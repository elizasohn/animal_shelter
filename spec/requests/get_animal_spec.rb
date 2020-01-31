require 'rails_helper'

describe 'GET /animals/:id', :type => :request do
    context '(valid request)' do
        before do
            pet = Animal.create!(name: 'Cheeky Bastard', kind: 'cat', breed: 'Siamese', age: '10' )
            get "/animals/#{pet.id}"
        end

        it 'returns a specific animal' do
            expect(JSON.parse(response.body)['breed']).to eq 'Siamese'
        end
        it 'returns status code 200 if animal exists' do
            expect(response).to have_http_status 200
        end
    end

    context '(bad request)' do
        before { get '/animals/0' }

        it 'returns a detailed error message' do
            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Animal with \'id\'=0'
        end
        it 'returns status code 404' do
            expect(response).to have_http_status 404
        end
    end
end
