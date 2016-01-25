require 'spec_helper'
require_relative '../../../../apps/web/views/sessions/create'

describe Web::Views::Sessions::Create do
  let(:exposures) {  }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/new.html.erb') }
  let(:view)      { Web::Views::Sessions::Create.new(template, exposures) }
  let(:rendered)  { view.render }
end
