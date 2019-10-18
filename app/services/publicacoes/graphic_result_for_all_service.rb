module Publicacoes
  module GraphicResultForAllService
    class << self

      def build(publicacoes)
        @result = []
        years = publicacoes.map {|pblc| pblc["ano"]}.uniq
        areas = Area.all

        Instituicao.all.each do |inst|
          @result.push({ "instituicao": "#{inst.sigla}"})

          years.each do |year|
            @result.last[:data].present? ? @result.last[:data].push({"ano": year}) : @result.last.merge!("data": [{"ano": year}])

            areas.each do |area|
              @result.last[:data].last.merge!("#{area.nome}": Publicacao.where(area: area, instituicao_id: inst.id, ano:year).count)
            end
          end
        end
        @result
      end

    end
  end
end