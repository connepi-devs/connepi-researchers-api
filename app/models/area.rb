# == Schema Information
#
# Table name: areas
#
#  id         :bigint           not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < ApplicationRecord
  self.table_name = 'areas'

  has_many :publications, class_name: 'Publicacao'
end
