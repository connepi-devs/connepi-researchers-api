module Publicacoes
  module GraphicResultsService
    class << self

      def build(publicacoes, params)
        @result = []
        years = publicacoes.map {|pblc| pblc["ano"]}.uniq

        years.each do |year|
          @result.push({ "ano": year,})
          params[:outros].present? ? registers_per_others(@result, year) : verify_params_to_registers(@result, params, year)
        end
        @result
      end

      def verify_params_to_registers(result, params, year)
        params.blank? ? all_registers(result, year) : registers_per_instituition(result, year, params[:instituicao_id])
      end

      def all_registers(result, year)
        Area.all.each do |area|
          result.last.merge!("#{area.nome}": Publicacao.where(area: area, ano: year).count)
        end
      end

      def registers_per_instituition(result, year, instituition_id)
        Area.all.each do |area|
          result.last.merge!(
            "INSTITUICAO": Instituicao.find(instituition_id).sigla,
            "#{area.nome}": Publicacao.where(area: area, ano: year, instituicao_id: instituition_id).count
          )
        end
      end

      def registers_per_others(result, year)
        Area.all.each do |area|
          result.last.merge!(
            "#{area.nome}": Publicacao.where(area: area, ano: year)
                                      .joins(:instituicao)
                                      .merge(Instituicao.where(regiao: 'outros')).count
          )
        end
      end

    end
  end
end