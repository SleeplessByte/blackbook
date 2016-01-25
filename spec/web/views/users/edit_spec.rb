require 'spec_helper'
require_relative '../../../../apps/web/views/users/edit'

describe Web::Views::Users::Edit do
  let(:exposures) { }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/edit.html.erb') }
  let(:view)      { Web::Views::Users::Edit.new(template, exposures) }
  let(:rendered)  { view.render }
end
