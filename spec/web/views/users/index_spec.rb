require 'spec_helper'
require_relative '../../../../apps/web/views/users/index'

describe Web::Views::Users::Index do
  let(:exposures) { }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/users/index.html.erb') }
  let(:view)      { Web::Views::Users::Index.new(template, exposures) }
  let(:rendered)  { view.render }
end
