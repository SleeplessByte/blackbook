require_relative 'form'

module Web::Views::Interactions
  class Update
    include Web::View
    include Form
    template 'interactions/edit'
  end
end
