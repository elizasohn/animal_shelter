# spec/integration/animals_spec.rb

require 'swagger_helper'
describe 'Animal Shelter API' do
  path '/animals' do
    post 'Creates a animal' do
      tags 'Animals'
      consumes 'application/json', 'application/xml'
      parameter name: :animal, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          kind: { type: :string },
          breed: { type: :string },
          age: { type: :integer }
        },
        required: [ 'name', 'kind', 'breed', 'age' ]
      }

      response '201', 'animal created' do
        let(:animal) { { name: 'fuzzworth', kind: 'cat', breed: 'tabby', age: '2' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:animal) { { name: 'fuzzworth' } }
        run_test!
      end
    end
  end

  path '/animals/{id}' do
    get 'Retrieves an animal' do
      tags 'Animals'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'animal found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            kind: { type: :string },
            breed: { type: :string },
            age: { type: :integer }
          },
          required: [ 'id', 'name', 'kind', 'breed', 'age' ]
        let(:id) { Animal.create(name: 'fuzzworth', kind: 'cat', breed: 'tabby', age: '2').id }
        run_test!
      end

      response '404', 'animal not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/fuzzworth' }
        run_test!
      end
    end
  end
end
