Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # scope :api do
  #   get 'publicacoes/build_graphic', to: 'publicacoes#build_graphic'
  #   get 'publicacoes/institutos_federais_do_norte_e_nordeste', to: 'publicacoes#federal_institutes_chart_data'
  #   get 'publicacoes/general_graphic', to: 'publicacoes#general_graphic'
  #
  #   resources :instituicoes, only: [:index]
  # end

end
