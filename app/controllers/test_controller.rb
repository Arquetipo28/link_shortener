class TestController < ApplicationController
  def test
    render json: { message: 'Ok' }, status: :ok
  end
end
