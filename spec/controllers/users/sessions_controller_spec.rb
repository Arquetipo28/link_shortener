require 'rails_helper'

RSpec.describe Users::SessionsController, type: :request do
  describe 'POST /users/sign_in' do
    context 'with valid user' do
      let(:user) { create(:user, email: 'test@mailinator.com', password: 'test12345') }

      it 'should have Access-Token header' do
        post '/users/sign_in', params: { user: { email: user.email, password: user.password } }
        
        expect(response.headers['Access-Token']).to be_present
      end
    end
  end
end
