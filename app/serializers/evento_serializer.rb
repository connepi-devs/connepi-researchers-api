class EventoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :state, :year, :file, :articles_count

  def file
    rails_blob_path(object.file, only_path: true) if object.file.attached?
  end

  def articles_count
    Evento.articles_count(object)
  end
end
