require 'spec_helper'

describe Actor do
  it 'can be initialised with attributes' do
    actor = Actor.new( name_first: 'Foo', name_last: 'Bar' )

    actor.name_first.must_equal 'Foo'
    actor.name_last.must_equal 'Bar'
  end

  describe Hanami::Validations do

    before do
      @actor = Actor.new( {} )
    end

    describe 'when no fields' do
      it 'is not valid' do
        @actor.valid?.must_equal false
      end
    end

    describe 'when only a first name' do
      it 'is not valid' do
        @actor.name_first = 'Foo'
        @actor.valid?.must_equal false
      end
    end

    describe 'when only a user id' do
      it 'is not valid' do
        @actor.user_id = 1
        @actor.valid?.must_equal false
      end
    end

    describe 'when having both user id and first name' do
      it 'is valid' do
        @actor.name_first = 'Foo'
        @actor.user_id = 1
        @actor.valid?.must_equal true
      end
    end

    describe 'when having both user id and first name' do
      it 'is valid' do
        @actor.name_first = 'Foo'
        @actor.user_id = 1
        @actor.valid?.must_equal true
      end
    end

    describe 'when validating a user id' do

      before do
        @actor = Actor.new( name_first: 'Foo' )
      end

      describe 'when it is an integer' do
        it 'is valid' do
          @actor.user_id = 1
          @actor.valid?.must_equal true
        end
      end

      describe 'when it is not an integer' do
        it 'is not valid' do
          @actor.user_id = "abc"
          @actor.valid?.must_equal false
        end
      end

    end

  end
end
