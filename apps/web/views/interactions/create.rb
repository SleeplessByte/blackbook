require_relative 'form'

module Web::Views::Interactions
  class Create
    include Web::View
    include Form
    template 'interactions/new'
  end
end
