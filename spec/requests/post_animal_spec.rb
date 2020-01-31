require 'rails_helper'

describe 'POST /animals', :type => :request do
  context '(valid request)' do
    before do
      post '/animals', params: { :name => 'fuzzy', :kind => "cat", :breed => "maine coon", :age => 3 }
    end

    it 'returns the name' do
      expect(JSON.parse(response.body)['name']).to eq('fuzzy')
    end

    it 'returns the kind content' do
      expect(JSON.parse(response.body)['kind']).to eq('cat')
    end

    it 'returns the breed' do
      expect(JSON.parse(response.body)['breed']).to eq('maine coon')
    end

    it 'returns the age' do
      expect(JSON.parse(response.body)['age']).to eq(3)
    end


    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
    # end
    #

    it 'returns a detailed success message' do
      expect(JSON.parse(response.body)['id']).to be_an_instance_of(Integer)
    end

    it 'returns status code 201' do
      expect(response).to have_http_status 201
    end
  end


  context '(bad request)' do
    before do
      post '/animals', params: { :name => '', :kind => '', :breed => '', :age => '' }
    end

    it 'returns a detailed error message' do
      expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Name can\'t be blank, Kind can\'t be blank, Breed can\'t be blank, Age can\'t be blank'
    end

    it 'returns status code 422 if validations fail' do
      expect(response).to have_http_status 422
    end
  end
end 
