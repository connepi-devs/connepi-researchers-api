class PublicacoesController < ApplicationController

  def build_graphic
    @publicacoes = Publicacao.all
    render json: ::Publicacoes::GraphicResultsService.list_per_year(@publicacoes)
  end

end
