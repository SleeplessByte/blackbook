require 'spec_helper'
require_relative '../../../../apps/web/views/profile/show'

describe Web::Views::Profile::Show do
  let(:exposures) { Hash[ user: User.new( username: 'Foo', email: 'foo@example.tld', id: 1 )] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/profile/show.html.erb') }
  let(:view)      { Web::Views::Profile::Show.new(template, exposures) }
  let(:rendered)  { view.render }
  let(:pattern)   { /<img src="http:\/\/www\.gravatar\.com\/avatar\/([A-z0-9]+)\?s=290">/ }

=begin

  def profile_description

  end

  def actors_count
    format_number user_associations.actors.count
  end

  def locations_count
    format_number user_associations.locations.count
  end
=end

  it 'exposes #user' do
    view.user.must_equal exposures.fetch(:user)
  end

  it "has the profile header" do
    view.profile_header.must_equal exposures.fetch(:user).username
  end

  it "has the profile meta" do
    view.profile_meta.must_equal exposures.fetch(:user).email
  end

  it "has a gravatar image based on the email" do
    img_html = view.profile_image.to_s
    img_html.must_match pattern
    hash = img_html.match( pattern ).captures.first
    hash.must_equal Digest::MD5.hexdigest( exposures.fetch(:user).email.strip.downcase )
  end
end
