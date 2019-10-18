class PublicacoesController < ApplicationController

  def build_graphic
    @publicacoes = Publicacao.all
    render json: ::Publicacoes::GraphicResultsService.build(@publicacoes, filter_params)
  end

  private

  def filter_params
    params.permit(:instituicao_id)
  end

end
