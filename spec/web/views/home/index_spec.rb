require 'spec_helper'
require_relative '../../../../apps/web/views/home/index'

describe Web::Views::Home::Index do
  let(:exposures) {  }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { Web::Views::Home::Index.new(template, exposures) }
  let(:rendered)  { view.render }

end
