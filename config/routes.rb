Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }

      get 'publications/institutos_federais_do_norte_e_nordeste', to: 'publications#federal_institutes_chart_data'
      get 'publications/general_graphic', to: 'publications#general_graphic'
      get 'publications/build_graphic', to: 'publications#build_graphic'
      get 'publications/articles_count', to: 'publications#articles_count'

      resources :events,       only: %i[create index]
      resources :publications, only: %i[index]
      resources :institutions, only: %i[index]
    end
  end
end
