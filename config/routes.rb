Rails.application.routes.draw do
  resources :user_text_blocks
  resources :lessons

  resources :rich_blocks, only: [:new, :create, :show, :edit, :update, :index]
  delete '/lesson_block/:id' => 'lesson_blocks#destroy', as: 'lesson_block'
  delete '/lesson_block/:id/unlink' => 'lesson_blocks#unlink', as: 'unlink'
  get '/lesson_block/:id/edit', to: 'lesson_blocks#edit', as: 'edit_lesson_block'
  
  get '/welcome', to: 'payment_sucess#index', as: 'welcome'
  
  get '/faq', to: 'faq#index', as: 'faq'
  devise_for :users, controllers: {confirmations: 'users/confirmations'}
  get '/admin', to: 'admin#index'

  resources :products
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
  
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  root 'home#index'
end
