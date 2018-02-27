Rails.application.routes.draw do
  get 'subscription', to: 'subscription#index', as: 'subscription'

  post 'subscription/init', as: 'subscription_init'

  get 'subscription/card_inscription_return', as: 'subscription_card_indscription_return'

  get 'subscription/success/:subscription_id', to: 'subscription#success', as: 'subscription_success'

  root to: 'landing#index'
  get 'landing/index'

  get 'charge', to: 'charge#index', as: 'charge'
  post 'charge/pay', as: 'charge_pay'
  get 'charge/return_after_form'

  get 'checkout', to: 'checkout#index', as: 'checkout'
  get 'checkout/register_transaction/:transaction_id' => 'checkout#register_transaction', as: 'checkout_register_transaction'
end
