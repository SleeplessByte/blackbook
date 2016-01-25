require 'spec_helper'
require_relative '../../../../apps/web/views/users/edit'

describe Web::Views::Users::Update do
  let(:exposures) { }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/users/edit.html.erb') }
  let(:view)      { Web::Views::Users::Update.new(template, exposures) }
  let(:rendered)  { view.render }
end
