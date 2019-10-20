module Publicacoes
  module ArticlesCount
    class << self
      def count_by(aggregation)
        data = fetch_data(aggregation)
        parsed_data = parse_data(aggregation, data)
        parsed_data
      end

      private 
      
      def check_aggregation(aggregation)
        valid_aggregations = %w[ano area instituicao regiao]
        raise ArgumentError, 
        'The required param group_by is missing.' if aggregation.nil?
        raise ArgumentError, 
          "The group_by must be one of these: #{valid_aggregations.join(', ')}" unless valid_aggregations.include?(aggregation)
      end

      def parse_data(aggregation, data)
        return data.map do |k, v|
          group = aggregation.to_sym
          group_value = k
          group_value = k.sigla if k.is_a? Instituicao
          group_value = k.nome if k.is_a? Area

          item = {}
          item[group] = group_value
          item[:regiao] = k.regiao if k.is_a? Instituicao
          item[:publicacoes] = v

          item
        end unless aggregation == 'regiao'

        count_by_region = []

        data.each do |k, v|
          region = k.regiao

          item_index = count_by_region.find_index { |i| i[:regiao] == region }

          if item_index.nil?
            item = {}
            item[:regiao] = region
            item[:publicacoes] = v
            count_by_region.push(item)
          else
            count_by_region[item_index][:publicacoes] += v
          end

        end

        count_by_region
      end

      def fetch_data(aggregation)
        check_aggregation(aggregation)
        
        group_by = aggregation == 'regiao' ?
          :instituicao : aggregation.to_sym

        Publicacao.group(group_by).count
      end
    end
  end
end