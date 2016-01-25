require 'spec_helper'
require_relative '../../../../apps/web/views/users/new'

describe Web::Views::Users::Create do
  let(:exposures) { }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/new.html.erb') }
  let(:view)      { Web::Views::Users::Create.new(template, exposures) }
  let(:rendered)  { view.render }
end
