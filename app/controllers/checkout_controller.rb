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
  QVO_API_URL = 'https://playground.qvo.cl'

  # Replace with your production api token on production
  QVO_API_TOKEN = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb21tZXJjZV9pZCI6ImNvbV9xdFM0Z3JvbV9BZk5oQXo2REFvMnl3IiwiYXBpX3Rva2VuIjp0cnVlfQ.sM047UoHi52rXNmE7nJModcudpZ1GoZ_71FV2oVpCxU
QVO_PUBLIC_KEY=FkZcGOAppvKR6CCVvZI6jQ'

  def index
    @product = PRODUCT
  end

  def register_transaction
    transaction_id = params[:transaction_id]
    get_transaction_url = "#{QVO_API_URL}/transactions/#{transaction_id}"

    # Double check if you are using your API TOKEN correctly. Otherwise this request will throw an authentication_error
    qvo_response = HTTParty.get(
      get_transaction_url,
      { headers: { "Authorization" => "Bearer #{QVO_API_TOKEN}" } },
    ).body

    qvo_response = JSON.parse(qvo_response, symbolize_names: true)
    puts "----> qvo_response: #{qvo_response}" # Just for debugging

    response = {}
    if (qvo_response[:status] == 'successful')
      response = {'status' => 'ok'}
    else
      response = {'status' => 'fail'}
    end

    puts "response: #{response}"

    render json: response
  end
end
