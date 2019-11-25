# == Schema Information
#
# Table name: publicacoes
#
#  id             :bigint           not null, primary key
#  publicacao     :string
#  autor          :string
#  status         :string
#  ano            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  area_id        :bigint
#  instituicao_id :bigint
#

require 'test_helper'

class PublicacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
