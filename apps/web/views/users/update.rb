require_relative 'form'

module Web::Views::Users
  class Update
    include Web::View
    include Form
    template 'users/edit'
  end
end
