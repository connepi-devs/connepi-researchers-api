class AddAreaAndInstituicaoToPublicacoes < ActiveRecord::Migration[5.1]
  def change
    add_reference :publicacoes, :area, index: true
    add_reference :publicacoes, :instituicao, index: true
  end
end
