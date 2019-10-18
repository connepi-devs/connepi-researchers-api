class InstituicoesController < ApplicationController

  def index
    @instituitions = Instituicao.where(search_params)
    render json: @instituitions
  end

  private

  def search_params
    params.permit(regiao: [])
  end

end
