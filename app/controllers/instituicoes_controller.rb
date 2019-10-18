class InstituicoesController < ApplicationController

  def index
    @instituitions = Instituicao.all
    render json: @instituitions
  end

end
