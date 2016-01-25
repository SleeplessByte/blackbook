require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/new'

describe Web::Controllers::Users::New do
  let(:action) { Web::Controllers::Users::New.new }
  let(:params) { Hash[] }
  let(:user)   { User.new( id: 1 ) }

  describe 'when not logged in' do
    it 'redirects to login' do
      response = action.call(params)
      response[0].must_equal 302
      response[1]['Location'].must_equal '/login'
    end
  end

  describe 'when logged in' do
    before do
      action.send( 'current_user=', user )
    end

    it "is successful" do
      response = action.call(params)
      response[0].must_equal 200
    end

    it 'has a new user' do
      action.call(params)
      action.user.must_be_kind_of User
      action.user.id.must_be_nil
    end
  end

end
