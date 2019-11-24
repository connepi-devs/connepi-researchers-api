module Api
  module V1
    class PublicationsController < Api::ApplicationController
      api :GET, '/v1/publications', 'Retorna a lista de publicações filtradas'
      param :session, String, desc: 'user is logged in', required: false
      param :titulo, String, desc: 'Titulo da publicação', required: false
      param :autor, String, desc: 'Autor da publicação', required: false
      param :instituicao_id, String, desc: 'ID da Instituição', required: false
      param :ano, :number, desc: 'Ano da publicação', required: false
      returns code: 200, desc: 'Retorna a lista de Publicações Filtradas' do
        property :titulo, String, desc: 'Titulo da publicação'
        property :autor, String, desc: 'Autor da publicação'
        property :ano, :number, desc: 'Ano da publicação'
        property :institiuicao, String, desc: 'Sigla da instituição'
      end
      header 'access-token', 'MzOKLGWHRdMrDpZxHaJC0w', required: true
      header 'client', 'oFaTV8F_OairTB77iwlqkA', required: true
      header 'uid', 'users uid', required: true
      def index
        publications = Publicacao.search(publications_params)
        render json: build_response(publications)
      end

      api :GET, '/v1/publications/build_graphic', 'description'
      param :session, String, desc: 'user is logged in', required: false
      returns code: 200, desc: 'descricao' do
        property :ano, String, desc: 'Ano da publicação'
        property :area, String, desc: 'Quantidade de publicações'
      end
      def build_graphic
        @publicacoes = Publicacao.all
        render json: ::Publicacoes::GraphicResultsService.build(@publicacoes, filter_params)
      end

      api :GET, '/v1/publications/federal_institutes_chart_data', 'description'
      param :session, String, desc: 'user is logged in', required: false
      returns code: 200, desc: 'descricao' do
      end
      def federal_institutes_chart_data
        render json: ::Publicacoes::Charts::FederalInstitutes.chart_data
      end

      api :GET, '/v1/publications/general_graphic', 'description'
      param :session, String, desc: 'user is logged in', required: false
      returns code: 200, desc: 'descricao' do
      end
      def general_graphic
        @publicacoes = Publicacao.all
        render json: ::Publicacoes::GraphicResultForAllService.build(@publicacoes)
      end

      api :GET, '/v1/publications/articles_count', 'description'
      param :session, String, desc: 'user is logged in', required: false
      param :group_by, String, desc: 'Tipo de Agrupamento [ano area instituicao regiao]', required: true
      returns code: 200, desc: 'descricao' do
      end
      def articles_count
        data = publications_service.count_by(publications_params)
        render json: data, status: :ok
      end

      private

      def publications_service
        @publications_service ||= ::Publicacoes::PublicationsService.new
      end

      def build_response(publications)
        publications&.map { |publication| ::Presenters::Publications::PublicationPresenter.new(publication) }
      end

      def publications_params
        params.require(:publications).permit(:titulo, :autor, :instituicao, :ano, :group_by) if params.include?(:publications)
      end

      def filter_params
        params.permit(:instituicao_id, :outros)
      end
    end
  end
end
