Rails.application.routes.draw do

  scope '/:locale', locale: AVAIABLE_LOCALES do

    devise_for :users

    get '/' => 'main_pages#index', as: :companion_hub

    get 'the_movement' => 'main_pages#the_movement'

    get 'contact_us' => 'main_pages#contact_us'

    get 'oh_maria' => 'main_pages#oh_maria'

    get 'prayers' => 'prayers#index'
    namespace :prayers do
      get 'hail_mary'
    end

  end

  # Redirect to the landing page when it's an invalid route.
  get '*path' => redirect('/')

  root 'landing#index'

end
