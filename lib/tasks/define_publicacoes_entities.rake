namespace :define_publicacoes_entities do
  desc "Define instituicoes table and area table based on publicacoes"

  #There are 11 thousand of registers about publications
  #There are 331 universities registered
  
  task define_entities: :environment do
    Publicacao.all.each do |publicacao|
      Instituicao.create(
        nome: publicacao.instituicao_attribute,
        sigla: publicacao.instituicao_attribute
      ) unless Instituicao.where(nome: publicacao.instituicao_attribute).any?

      Area.create(nome: publicacao.area_attribute) unless Area.where(nome: publicacao.area_attribute).any?
      puts "Criando Registros..."
    end
  end

end