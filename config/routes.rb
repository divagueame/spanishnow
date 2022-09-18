Rails.application.routes.draw do
  
  resources :feedbacks
  
  resources :multiple_open_blocks do 
    resources :multiple_open_pieces
  end

  resources :user_text_blocks do 
    resources :user_text_answers, except: [:index, :destroy ]
  end

  resources :lessons
  
  get '/course/:id', to: 'courses#show', as: 'course'
  post 'lesson/:id/toggle_active_lesson', to: 'lessons#toggle_active_lesson', as: 'toggle_active_lesson'

  resources :rich_blocks, only: [:new, :create, :show, :edit, :update, :index]
  delete '/lesson_block/:id' => 'lesson_blocks#destroy', as: 'lesson_block'
  delete '/lesson_block/:id/unlink' => 'lesson_blocks#unlink', as: 'unlink'
  get '/lesson_block/:id/edit', to: 'lesson_blocks#edit', as: 'edit_lesson_block'
  
  get '/welcome', to: 'payment_sucess#index', as: 'welcome'
  
  get '/faq', to: 'faq#index', as: 'faq'
  devise_for :users, controllers: {confirmations: 'users/confirmations', sessions: 'users/sessions'}
  get '/admin', to: 'admin#index'

  resources :products
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
  
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  root 'home#index'
end
