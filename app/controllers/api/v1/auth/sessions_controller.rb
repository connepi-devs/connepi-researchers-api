module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController

        api :POST, '/v1/auth/sign_in', 'Autentica um novo usuario'
        param :email, String, desc: 'Email', required: true
        param :password, String, desc: 'Email', required: true
        returns code: 200, desc: 'Descrição' do
          property :id, String, desc: 'id'
          property :email, String, desc: 'email'
        end
        def create
          super
        end
      end
    end
  end
end
