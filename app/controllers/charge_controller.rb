class ChargeController < ApplicationController
  PRODUCT = {
    "id" => 1,
    "name" => "Polera",
    "price" => 29900,
    "img_path" => 'basketball-jersey.png',
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

  def pay
    amount = params[:amount]

    if (amount.to_i != PRODUCT['price'])
      raise 'Charged amount must match product price'
    end

    init_transaction_response = init_transaction(amount)
    if init_transaction_response[:error].present?
      redirect_to charge_path, notice: init_transaction_response[:error][:message]
    else
      redirect_to init_transaction_response[:redirect_url]
    end
  end

  def return_after_form
    transaction_id = params['transaction_id']
    @response = get_transaction(transaction_id)
    if @response[:status] == 'successful'
      render :success
    else
      redirect_to charge_path, notice: @response[:status]
    end
  end

  private
  def init_transaction(amount)
    init_transaction_url = "#{QVO_API_URL}/webpay_plus/charge"

    # Double check if you are using your API TOKEN correctly. Otherwise this request will throw an authentication_error
    qvo_response = HTTParty.post(
      init_transaction_url,
      { headers:
        {
          "Authorization" => "Bearer #{QVO_API_TOKEN}",
          'Content-Type' => 'application/json'
        },
        body: {
          'return_url' => charge_return_after_form_url,
          'amount' => amount
        }.to_json
      },
    ).body

    return JSON.parse(qvo_response, symbolize_names: true)
  end

  def get_transaction(transaction_id)
    get_transaction_url = "#{QVO_API_URL}/transactions/#{transaction_id}"

    qvo_response = HTTParty.get(
      get_transaction_url,
      { headers:
        {
          "Authorization" => "Bearer #{QVO_API_TOKEN}",
          'Content-Type' => 'application/json'
        }
      },
    ).body

    return JSON.parse(qvo_response, symbolize_names: true)
  end
end
