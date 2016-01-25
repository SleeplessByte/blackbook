require 'spec_helper'
require_relative '../../../../apps/web/views/users/new'

describe Web::Views::Users::New do
  let(:exposures) { }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/users/new.html.erb') }
  let(:view)      { Web::Views::Users::New.new(template, exposures) }
  let(:rendered)  { view.render }
end
