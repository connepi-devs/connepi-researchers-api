# == Schema Information
#
# Table name: publicacoes
#
#  id             :bigint           not null, primary key
#  publicacao     :string
#  autor          :string
#  instituicao    :string
#  status         :string
#  area           :string
#  ano            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  area_id        :bigint
#  instituicao_id :bigint
#

class Publicacao < ApplicationRecord
  self.table_name = :publicacoes

  belongs_to :area
  belongs_to :instituicao

  def area_attribute
    read_attribute(:area)
  end

  def instituicao_attribute
    read_attribute(:instituicao)
  end
end
