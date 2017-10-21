require 'rails_helper'

RSpec.describe 'Components API', type: :request do
  # initialize test data
  let!(:ship) { create(:ship) }
  let!(:components) { create_list(:component, 10) }
  let(:ship_id) { ship.id }
  let(:component_id) { components.first.id }

  # Test suite for GET /ships/:ship_id/components
  describe 'GET /ships/:ship_id/components' do
    # make HTTP get request before each example
    before { get '/ships/:ship_id/components' }

    it 'returns components' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /components/:id
  describe 'GET /ships/:ship_id/components/:id' do
    before { get "/ships/:ship_id/components/#{component_id}" }

    context 'when the record exists' do
      it 'returns the component' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(component_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:component_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Component/)
      end
    end
  end

  # Test suite for POST /components
  describe 'POST /components' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', affect: 'yellow' } }

    context 'when the request is valid' do
      before { post '/ships/:ship_id/components', params: valid_attributes }

      it 'creates a component' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/ships/:ship_id/components', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Affect can't be blank/)
      end
    end
  end

  # Test suite for PUT /ships/:ship_id/components/:id
  describe 'PUT /ships/:ship_id/components/:id' do
    let(:valid_attributes) { { name: 'Heart of Gold' } }

    context 'when the record exists' do
      before { put "/ships/:ship_id/components/#{component_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /ships/:ship_id/components/:id
  describe 'DELETE /ships/:ship_id/components/:id' do
    before { delete "/ships/:ship_id/components/#{component_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
