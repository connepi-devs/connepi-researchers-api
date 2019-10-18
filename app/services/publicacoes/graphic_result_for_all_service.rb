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
            @result.last.merge!("data": [{"ano": year}])
            areas.each do |area|
              binding.pry
              @result.last[:data].last.merge!("#{area.nome}": Publicacao.where(area_id: area.id, instituicao_id: inst.id).count)
            end
          end
        end
        @result
      end

    end
  end
end