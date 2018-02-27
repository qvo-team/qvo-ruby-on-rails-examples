# encoding: utf-8
class CheckoutController < ApplicationController
  PRODUCT = {
    "id" => 2,
    "name" => "Zapatillas Clásicas",
    "price" => 45900,
    "img_path" => 'shoe.png',
    "description" =>
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium cumque asperiores illum, dolores totam nostrum eum ducimus facilis, fuga possimus, temporibus ipsa quia nobis consequuntur voluptas libero? Amet, nam magnam."
  }

  # Change it to https://api.qvo.cl on production
  API_URL = 'https://playground.qvo.cl'

  # Replace with your production api token on production
  API_TOKEN = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb21tZXJjZV9pZCI6ImNvbV9xdFM0Z3JvbV9BZk5oQXo2REFvMnl3IiwiYXBpX3Rva2VuIjp0cnVlfQ.sM047UoHi52rXNmE7nJModcudpZ1GoZ_71FV2oVpCxU'

  def index
    @product = PRODUCT
  end

  def register_transaction
    transaction_id = params[:transaction_id]
    get_transaction_url = "#{API_URL}/transactions/#{transaction_id}"

    # Double check if you are using your API TOKEN correctly. Otherwise this request will throw an authentication_error
    response = HTTParty.get(
      get_transaction_url,
      { headers: { "Authorization" => "Bearer #{API_TOKEN}" } },
    ).body

    response = JSON.parse(response, symbolize_names: true)

    if (qvo_response[:status] == 'successful')
      render json: {'status' => 'ok'}
    else
      render json: {'status' => 'fail'}
    end
  end
end
