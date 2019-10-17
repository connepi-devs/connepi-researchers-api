# == Schema Information
#
# Table name: instituicoes
#
#  id         :bigint           not null, primary key
#  sigla      :string
#  regiao     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Instituicao < ApplicationRecord
  self.table_name = :instituicoes
end
