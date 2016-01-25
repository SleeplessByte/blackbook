require 'spec_helper'
require 'bcrypt'
require_relative '../../../../apps/web/controllers/profile/show'

describe Web::Controllers::Profile::Show do

  before do
    @user = UserRepository.create(
        User.new( username: 'foo', email: 'foo@bar.com', password: BCrypt::Password.create( 'foo' ) )
    )
  end

  after do
    UserRepository.delete @user
  end

  let(:action) { Web::Controllers::Profile::Show.new }
  let(:params) { Hash[] }

  describe 'when not logged in' do

    before do
      action.send( :'current_user=', nil )
    end

    it 'redirects to login' do
      response = action.call(params)
      response[0].must_equal 302
      response[1]['Location'].must_equal '/login'
    end
  end

  describe 'when logged in' do

    before do
      action.send( :'current_user=', @user )
    end

    it 'shows the user profile' do
      response = action.call(params)
      response[0].must_equal 200

      action.user.id.must_equal @user.id
    end
  end

end
