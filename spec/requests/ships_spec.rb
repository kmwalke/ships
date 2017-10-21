require 'rails_helper'

RSpec.describe 'Ships API', type: :request do
  # initialize test data
  let!(:ships) { create_list(:ship, 10) }
  let(:ship_id) { ships.first.id }

  # Test suite for GET /ships
  describe 'GET /ships' do
    # make HTTP get request before each example
    before { get '/ships' }

    it 'returns ships' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /ships/:id
  describe 'GET /ships/:id' do
    before { get "/ships/#{ship_id}" }

    context 'when the record exists' do
      it 'returns the ship' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(ship_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:ship_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ship/)
      end
    end
  end

  # Test suite for POST /ships
  describe 'POST /ships' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', color: 'yellow' } }

    context 'when the request is valid' do
      before { post '/ships', params: valid_attributes }

      it 'creates a ship' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/ships', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Color can't be blank/)
      end
    end
  end

  # Test suite for PUT /ships/:id
  describe 'PUT /ships/:id' do
    let(:valid_attributes) { { name: 'Heart of Gold' } }

    context 'when the record exists' do
      before { put "/ships/#{ship_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /ships/:id
  describe 'DELETE /ships/:id' do
    before { delete "/ships/#{ship_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end