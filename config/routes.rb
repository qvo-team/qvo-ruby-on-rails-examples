Rails.application.routes.draw do
  get 'landing/index'

  root to: 'landing#index'
  get 'checkout', to: 'checkout#index', as: 'checkout'
  get 'checkout/register_transaction/:transaction_id' => 'checkout#register_transaction', as: 'checkout_register_transaction'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
