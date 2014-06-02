Rails.application.routes.draw do

  scope "/:locale", locale: /en-US|pt-BR|pt-PT/ do

    get 'prayers' => 'prayers#index'
    namespace :prayers do
      get 'hail_mary'
    end

  end

  # Redirect to the landing page when it's an invalid route.
  get '*path' => redirect('/')

  root 'landing#index'

end
