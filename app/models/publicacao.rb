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

  belongs_to :area, foreign_key: 'area_id'
  belongs_to :instituicao, foreign_key: 'instituicao_id'

  def area_attribute
    read_attribute(:area)
  end

  def instituicao_attribute
    read_attribute(:instituicao)
  end

  def self.search(params)
    params ? find_publications(params) : []
  end

  def self.find_publications(params)
    publication = Publicacao.order(:publicacao)
    publication = publication.where('publicacao ilike ?', "%#{params[:titulo]}%") if params[:titulo].present?
    publication = publication.where('autor like ?', "%#{params[:autor]}%") if params[:autor].present?
    publication = publication.where(instituicao_id: params[:instituicao]) if params[:instituicao].present?
    publication = publication.where(area_id: params[:area]) if params[:area].present?
    publication = publication.where(ano: params[:ano]) if params[:ano].present?
    publication
  end
end
