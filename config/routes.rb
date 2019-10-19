Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api do
    get 'publicacoes/build_graphic', to: 'publicacoes#build_graphic'
    get 'publicacoes/institutos_federais_do_norte_e_nordeste', to: 'publicacoes#federal_institutes_chart_data'
    get 'publicacoes/general_graphic', to: 'publicacoes#general_graphic'
    get 'publicacoes/articles_count', to: 'publicacoes#articles_count'

    resources :instituicoes, only: [:index]
  end

end
