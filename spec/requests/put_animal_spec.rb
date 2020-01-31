require 'rails_helper'

describe 'PUT /animals/:id', :type => :request do
    context '(valid request)' do
        before do
            pet = Animal.create!(name: 'cat', kind: 'dog', breed: 'horse', age: '2')
            put "/animals/#{pet.id}", params: {name: 'notcat', kind: 'cat', breed: 'muffin', age: '10'}
        end

        it 'returns a detailed success message' do
            expect(JSON.parse(response.body)['message']).to eq 'This animal has been updated successfully.'
        end
        it 'returns status code 200' do
            expect(response).to have_http_status 200
        end
    end
    context '(bad requests)' do

        context '(non-existent animal)' do
            before { put '/animals/0', params: {content: '1', city: '2', country: '3'} }

            it 'returns a detailed error message' do
                expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Animal with \'id\'=0'
            end
            it 'returns status code 404' do
                expect(response).to have_http_status 404
            end
        end

        context '(invalid parameters)' do
            before do
                pet = Animal.create!(name: 'cat', kind: 'dog', breed: 'horse', age: '2')
                put "/animals/#{pet.id}", params: {name: '', kind: '', breed: '', age: ''}
            end

            it 'returns a detailed error message' do
                expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Name can\'t be blank, Kind can\'t be blank, Breed can\'t be blank, Age can\'t be blank'
            end

            it 'returns status code 422 if validations fail' do
                expect(response).to have_http_status 422
            end
        end

    end
end
