Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api do
    get 'publicacoes/build_graphic', to: 'publicacoes#build_graphic'

    resources :instituicoes, only: [:index]
  end

end
