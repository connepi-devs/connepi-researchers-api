module Publicacoes
  class PublicationsSpreadsheetService

    def add_publications(spreadsheet)
      xsl = Roo::Spreadsheet.open(spreadsheet[:file].tempfile)
      added_publications = []
      xsl.each(publicacao: 'publicacao', autor: 'autor', ano: 'ano', area_id: 'area', instituicao_id: 'instituicao',
               file_url: 'file_url') do |publication|
        next unless check_first_row(publication)

        publication = validate_publication(publication)
        added_publications.push(publication) if save_publication(publication)
      end
      added_publications
    end

    private

    def find_area_and_instituicao(publicacao)
      instituicao = Instituicao.where('sigla ilike ?', "%#{publicacao[:instituicao_id]}%").first
      area = Area.where('nome ilike ?', "%#{publicacao[:area_id]}%").first

      publicacao[:instituicao_id] = instituicao.id
      publicacao[:area_id] = area.id
      publicacao
    end

    def check_first_row(publicacao)
      return true if publicacao[:publicacao] != 'publicacao'

      false
    end

    def validate_publication(publicacao)
      publication = find_area_and_instituicao(publicacao)
      publication
    end

    def save_publication(publication)
      publication = Publicacao.new(publication)
      publication.save
    end
  end
end
