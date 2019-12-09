module Publicacoes
  class PublicationsSpreadsheetService
    def add_publications(spreadsheet)
      xsl = Roo::Spreadsheet.open(spreadsheet[:file].tempfile)
      spreadsheet_line = 2
      ActiveRecord::Base.transaction do
        added_publications = []
        xsl.each(publicacao: 'publicacao', autor: 'autor', ano: 'ano', area_id: 'area', instituicao_id: 'instituicao',
                 file_url: 'file_url') do |publication|
          next unless check_first_row(publication)

          publication = validate_publication(publication)
          added_publications.push(publication) if save_publication(publication)
          spreadsheet_line += 1
        end
        added_publications
      rescue ActiveRecord::RecordInvalid
        fail_response(spreadsheet_line)
      end
    end

    private

    def find_area_and_instituicao(publicacao)
      instituicao = validate_instituicao(publicacao) if publicacao[:instituicao_id]
      area = Area.where('nome ilike ?', "%#{publicacao[:area_id]}%").first if publicacao[:area_id]
      publicacao = assigns_publication(publicacao, instituicao, area) if instituicao && area
      publicacao
    end

    def assigns_publication(publicacao, instituicao, area)
      publicacao[:instituicao_id] = instituicao.id
      publicacao[:area_id] = area.id
      publicacao
    end

    def validate_instituicao(publicacao)
      instituicao = Instituicao.where('sigla ilike ?', "%#{publicacao[:instituicao_id]}%").first if publicacao[:instituicao_id]
      return save_institution(publicacao) unless instituicao

      instituicao
    end

    def check_first_row(publicacao)
      return true if publicacao[:publicacao] != 'publicacao'

      false
    end

    def validate_publication(publicacao)
      publication = find_area_and_instituicao(publicacao)
      publication
    end

    def fail_response(line)
      { error: 'Falha ao cadastrar instituicoes / Area', spreadsheet_line: line }
    end

    def save_institution(publicacao)
      instituicao = Instituicao.new
      instituicao.sigla = publicacao[:instituicao_id]
      instituicao.regiao = 'outros'
      instituicao.save!
      instituicao
    end

    def save_publication(publication)
      publication = Publicacao.new(publication)
      publication.save!
    end
  end
end
