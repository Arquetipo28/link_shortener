require 'rails_helper'

RSpec.describe TestController, type: :request do
  describe 'GET test' do
    it 'should return message ok' do
      get '/test'
      expect(response.parsed_body['message']).to eq 'Ok'
    end
  end
end
