class PublicacoesController < ApplicationController

  def build_graphic
    @publicacoes = Publicacao.all
    render json: ::Publicacoes::GraphicResultsService.build(@publicacoes, filter_params)
  end

  # Retrieve the count of articles of the
  # Federal Institutes from North and NorthEast
  def federal_institutes_chart_data
    render json: ::Publicacoes::Charts::FederalInstitutes.chart_data
  end

  private

  def filter_params
    params.permit(:instituicao_id, :outros)
  end

end
