module Presenters
  module Publications
    class PublicationPresenter
      attr_reader :id, :publicacao, :autor, :ano, :file_url

      def initialize(attrs = {})
        @id                = attrs.id
        @titulo            = attrs.publicacao
        @autor             = attrs.autor
        @ano               = attrs.ano
        @instituicao       = find_instituicao(attrs.instituicao_id)
        @area              = find_area(attrs.area_id)
        @file_url          = attrs.file_url
      end

      private

      def find_instituicao(instituicao_id)
        Instituicao.find(instituicao_id).sigla
      end

      def find_area(area_id)
        Area.find(area_id).nome
      end
    end
  end
end
