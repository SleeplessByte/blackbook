require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/edit'

describe Web::Controllers::Users::Edit do
  let(:action) { Web::Controllers::Users::Edit.new }
  let(:params) { Hash[] }

  describe 'when not logged in' do
    it 'redirects to login' do
      response = action.call(params)
      response[0].must_equal 302
      response[1]['Location'].must_equal '/login'
    end
  end

end
