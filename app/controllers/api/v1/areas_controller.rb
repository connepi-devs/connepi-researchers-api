module Api
  module V1
    class AreasController < Api::ApplicationController
      api :GET, '/v1/areas', 'Retorna a lista de areas das publicacoes'
      returns code: 200, desc: 'Retorna a lista de Publicações Filtradas' do
        property :id, :number, desc: 'ID da area'
        property :nome, String, desc: 'Nome da area da publicação'
      end
      header 'access-token', 'MzOKLGWHRdMrDpZxHaJC0w', required: true
      header 'client', 'oFaTV8F_OairTB77iwlqkA', required: true
      header 'uid', 'users uid', required: true
      def index
        areas = Area.all
        render json: build_response(areas)
      end

      def build_response(areas)
        areas&.map { |area| ::Presenters::Areas::AreaPresenter.new(area) }
      end
    end
  end
end
