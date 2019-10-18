module Publicacoes
  module GraphicResultsService
    class << self

      def list_per_year(publicacoes)
        @result = []
        years = publicacoes.map {|pblc| pblc["ano"]}.uniq

        years.each do |year|
          @result.push({ "ano": year,})
          Area.all.each do |area|
            @result.last.merge!("#{area.nome}": Publicacao.where(area: area, ano: year).count)
          end
        end
        @result
      end

    end
  end
end