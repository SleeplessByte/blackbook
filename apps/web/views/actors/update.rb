require_relative 'form'

module Web::Views::Actors
  class Update
    include Web::View
    include Form
    template 'actors/edit'
  end
end
