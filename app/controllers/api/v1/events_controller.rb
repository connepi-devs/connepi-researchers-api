module Api
  module V1
    class EventsController < Api::ApplicationController
      include ActionController::Serialization

      api :GET, '/v1/events', 'Retorna a lista de eventos cadastrados'
      returns code: 200, desc: 'Retorna a lista de eventos cadastrados' do
        property :name, String, desc: 'Nome do Evento'
        property :year, Integer, desc: 'Ano do Evento'
        property :state, String, desc: 'Estado do Evento'
        property :articles_count, Integer, desc: 'Total de Publicações'
        property :file, String, desc: 'Link para os anais do Evento'
      end
      header 'access-token', 'MzOKLGWHRdMrDpZxHaJC0w', required: true
      header 'client', 'oFaTV8F_OairTB77iwlqkA', required: true
      header 'uid', 'users uid', required: true
      def index
        @events = Evento.all
        render json: @events, status: :ok
      end

      def create
        @event = Evento.create!(event_params)
        render json: @event, status: :created
      end

      private

      def event_params
        params.permit(:name, :year, :state, :file)
      end
    end
  end
end
