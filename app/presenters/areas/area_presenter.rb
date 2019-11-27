module Presenters
  module Areas
    class AreaPresenter
      attr_reader :id, :nome

      def initialize(attrs = {})
        @id               = attrs.id
        @nome             = attrs.nome
      end
    end
  end
end
