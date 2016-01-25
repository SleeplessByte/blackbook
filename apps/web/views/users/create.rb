require_relative 'form'

module Web::Views::Users
  class Create
    include Web::View
    include Form
    template 'users/new'
  end
end
