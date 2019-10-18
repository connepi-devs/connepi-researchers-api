module Publicacoes
  module GraphicResultsService
    class << self

      def build(publicacoes, filter_params)
        @result = []
        instituicao_id = filter_params[:instituicao_id]
        years = publicacoes.map {|pblc| pblc["ano"]}.uniq

        years.each do |year|
          @result.push({ "ano": year,})
          filter_params.blank? ? all_registers(@result, year) : registers_per_instituicao(@result, year, instituicao_id)
        end
        @result
      end

      def all_registers(result, year)
        Area.all.each do |area|
          result.last.merge!("#{area.nome}": Publicacao.where(area: area, ano: year).count)
        end
      end

      def registers_per_instituicao(result, year, instituicao_id)
        Area.all.each do |area|
          result.last.merge!(
            "INSTITUICAO": Instituicao.find(instituicao_id).sigla,
            "#{area.nome}": Publicacao.where(area: area, ano: year, instituicao_id: instituicao_id).count
          )
        end
      end

    end
  end
end