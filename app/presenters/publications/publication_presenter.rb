module Presenters
  module Publications
    class PublicationPresenter
      attr_reader :publicacao, :autor, :ano

      def initialize(attrs = {})
        @titulo            = attrs.publicacao
        @autor             = attrs.autor
        @ano               = attrs.ano
        @instituicao       = find_instituicao(attrs.instituicao_id)
      end

      private

      def find_instituicao(instituicao_id)
        Instituicao.find(instituicao_id).sigla
      end
    end
  end
end
