Rails.application.routes.draw do
  resources :youtube_blocks, except: [ :index ]
  patch 'study_session/update'
  delete '/study_session/:id' => 'study_session#destroy', as: 'study_session'

  get 'notifications', to: 'notifications#index', as: 'notifications'
  get 'notifications/:id', to: 'notifications#show', as: 'notification'
  
  # Lesson_blocks
  delete '/lesson_block/:id' => 'lesson_blocks#destroy', as: 'lesson_block'
  get '/lesson_block/:id/edit', to: 'lesson_blocks#edit', as: 'edit_lesson_block'

  resources :multiple_open_blocks, except: [:index ] do 
    resources :multiple_open_pieces
  end

  resources :user_text_blocks do 
    resources :user_text_answers, except: [:index, :destroy ]
  end
  
  resources :rich_blocks, only: [:new, :create, :show, :edit, :update]
  
  resources :feedbacks
  
  # Lessons
  resources :lessons, except: [ :index ]
  resources :lesson_groups

  patch 'drag/lesson'
  patch 'drag/lesson_group'
  
  post 'lesson/:id/toggle_active_lesson', to: 'lessons#toggle_active_lesson', as: 'toggle_active_lesson'

  resources :products
  get '/course/:id', to: 'courses#show', as: 'course'

  # Static
  get '/welcome', to: 'payment_sucess#index', as: 'welcome'
  get '/faq', to: 'faq#index', as: 'faq'
  get '/admin', to: 'admin#index'
  
  # Stripe
  resources :webhooks, only: [:create]
  post 'checkout/create', to: 'checkout#create'
  
  # System
  devise_for :users, controllers: {confirmations: 'users/confirmations', sessions: 'users/sessions'}
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  root 'home#index'
end
