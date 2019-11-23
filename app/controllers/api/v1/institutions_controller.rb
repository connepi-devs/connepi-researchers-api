module Api
  module V1
    class InstitutionsController < Api::ApplicationController
      api :GET, '/v1/institutions', 'Retorna a lista de instituições cadastradas'
      returns code: 200, desc: 'Retorna a lista de instituições cadastradas' do
        property :sigla, String, desc: 'Sigla da Instituição'
        property :regiao, String, desc: 'Região da Instituição'
      end
      header 'access-token', 'MzOKLGWHRdMrDpZxHaJC0w', required: true
      header 'client', 'oFaTV8F_OairTB77iwlqkA', required: true
      header 'uid', 'users uid', required: true
      def index
        @instituitions = Instituicao.where(search_params)
        render json: @instituitions
      end

      private

      def search_params
        params.permit(regiao: [])
      end
    end
  end
end
