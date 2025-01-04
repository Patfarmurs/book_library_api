# spec/requests/api/v1/books_spec.rb
require 'swagger_helper'

RSpec.describe 'Books API', type: :request do
  path '/api/v1/books' do
    get('list books') do
      tags 'Books'
      produces 'application/json'

      response(200, 'successful') do
        run_test!
      end
    end

    post('create book') do
      tags 'Books'
      consumes 'application/json'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          author: { type: :string },
          topic: { type: :string },
          quantity: { type: :integer },
          shelf_id: { type: :integer }
        },
        required: %w[title author topic quantity shelf_id]
      }

      response(201, 'created') do
        let(:book) { { title: 'Book Title', author: 'Author', topic: 'Topic', quantity: 3, shelf_id: 1 } }
        run_test!
      end
    end
  end
end
