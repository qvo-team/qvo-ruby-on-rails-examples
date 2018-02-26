Rails.application.routes.draw do
  root to: 'landing#index'
  get 'landing/index'

  get 'charge/index', as: 'charge'
  post 'charge/pay', as: 'charge_pay'
  get 'charge/return_after_form'

  get 'checkout', to: 'checkout#index', as: 'checkout'
  get 'checkout/register_transaction/:transaction_id' => 'checkout#register_transaction', as: 'checkout_register_transaction'
end
