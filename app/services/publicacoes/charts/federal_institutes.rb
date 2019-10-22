module Publicacoes
  module Charts
    module FederalInstitutes
      class << self
        def chart_data()
          data = Publicacao.group(:instituicao).count
          chart_data = parse_data(data)
          chart_data
        end

        private

        def is_a_federal_institute?(value)
          value =~ /^(if|instituto federal)+/i
        end

        def is_from_north_or_northeast?(value)
          value =~ /^(norte|nordeste)+/i
        end

        def parse_data(data)
          parsed_data = []
          others = { instituicao: "Outros", regiao: 'Outras', publicacoes: 0 }
          
          data.each do |k, v|
            if is_a_federal_institute?(k.sigla) && is_from_north_or_northeast?(k.regiao)
              parsed_data.push({ instituicao: k.sigla, regiao: k.regiao, publicacoes: v })
            else
              others[:publicacoes] += v
            end
          end

          parsed_data.push(others)
          parsed_data
        end
      end
    end
  end
end
