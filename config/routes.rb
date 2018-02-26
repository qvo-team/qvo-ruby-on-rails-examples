Rails.application.routes.draw do
  get 'landing/index'

  root to: 'landing#index'
  get 'checkout/index'
  get 'checkout/register_transaction'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
