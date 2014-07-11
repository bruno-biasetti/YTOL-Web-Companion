Rails.application.routes.draw do

  scope '/:locale', locale: AVAIABLE_LOCALES do

    devise_for :users

    get '/' => 'main_pages#index', as: :companion_hub

    get 'the_movement' => 'main_pages#the_movement'

    get 'meeting_guide' => 'meeting_guide#index'
    scope '/meeting_guide' do

      get 'prayers' => 'prayers#index'
      scope 'prayers' do
        get 'magnificat' => 'prayers#magnificat'
        get 'holy_spirit' => 'prayers#holy_spirit'
        get 'hail_mary' => 'prayers#hail_mary'
        get 'our_father' => 'prayers#our_father'
        get 'time_out' => 'prayers#time_out'

        # Provavelmente ficara em outro controller
        get 'the_rosary' => 'prayers#the_rosary'
      end

    end

    get 'contact_us' => 'main_pages#contact_us'

    get 'oh_maria' => 'main_pages#oh_maria'

  end

  # Redirect to the landing page when it's an invalid route.
  get '*path' => redirect('/')

  root 'landing#index'

end
