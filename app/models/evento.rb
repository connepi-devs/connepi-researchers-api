# == Schema Information
#
# Table name: eventos
#
#  id         :bigint           not null, primary key
#  name       :string
#  state      :string
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Evento < ApplicationRecord
  has_one_attached :file

  def self.articles_count(event)
    sql = <<-SQL
          SELECT count(id), ano
          FROM publicacoes
          GROUP BY ano
    SQL

    articles = ActiveRecord::Base.connection.execute(sql)
    article = articles.select { |a| a['ano'] == event.year }

    return article.first['count'] if article.present?
  end
end
