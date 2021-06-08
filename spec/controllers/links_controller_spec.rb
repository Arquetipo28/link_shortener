require 'rails_helper'

RSpec.describe LinksController, type: :request do
  describe 'POST /links' do
    context 'with valid data' do
      it 'should return a new short link' do
        post '/links', params: { original_link: 'https://google.com' }

        expect(response.parsed_body['id']).to be_present
      end
    end
  end

  describe 'GET /top' do
    context 'with existent links' do
      before :each do
        create(:short_link, visited_count: 1)
      end

      it 'should return one link' do
        get '/top'

        expect(response.parsed_body.first).to include('id', 'visited_count')
      end
    end
  end
end
