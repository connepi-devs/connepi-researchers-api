module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        api :POST, '/v1/auth', 'Cria um novo usuario'
        param :email, String, desc: 'Email', required: true
        param :password, String, desc: 'Senha', required: true
        param :password_confirmation,
              String,
              desc: 'Confirmação de senha', required: true
        returns code: 200, desc: 'Retorna o usuário cadastrado e autenticado' do
          property :status, String, desc: 'Status da requisição'
          property :data, String, desc: 'Informações da requisição'
        end
        def create
          super
        end
      end
    end
  end
end
