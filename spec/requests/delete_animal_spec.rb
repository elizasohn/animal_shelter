require 'rails_helper'

describe 'DELETE /animals/:id', :type => :request do
    context '(valid request)' do
        before do
            pet = Animal.create!(name: 'Jerkface Killer', kind: 'cat', breed: 'tabby', age: '12')
            delete "/animals/#{pet.id}"
        end

        it 'returns a detailed success message' do
            expect(JSON.parse(response.body)['message']).to eq 'This animal has been destroyed.'
        end
        it 'returns status code 200' do
            expect(response).to have_http_status 200
        end
    end

    context '(bad request)' do
        before { delete '/animals/0' }

        it 'returns a detailed error message' do
            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Animal with \'id\'=0'
        end
        it 'returns status code 404' do
            expect(response).to have_http_status 404
        end
    end
end
