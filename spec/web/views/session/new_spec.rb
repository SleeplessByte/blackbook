require 'spec_helper'
require_relative '../../../../apps/web/views/sessions/new'

describe Web::Views::Sessions::New do
  let(:exposures) { }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/sessions/new.html.erb') }
  let(:view)      { Web::Views::Sessions::New.new(template, exposures) }
  let(:rendered)  { view.render }
end
