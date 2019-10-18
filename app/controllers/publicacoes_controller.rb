class PublicacoesController < ApplicationController

  def build_graphic
    @publicacoes = Publicacao.all
    render json: ::Publicacoes::GraphicResultsService.build(@publicacoes, filter_params)
  end

  def general_graphic
    @publicacoes = Publicacao.all
    render json: ::Publicacoes::GraphicResultForAllService.build(@publicacoes)
  end

  private

  def filter_params
    params.permit(:instituicao_id, :outros)
  end

end
