require_relative 'form'

module Web::Views::Actors
  class Create
    include Web::View
    include Form
    template 'actors/new'
  end
end
