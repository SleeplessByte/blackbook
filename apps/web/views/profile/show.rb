module Web::Views::Profile
  class Show
    include Web::View

    def profile_image
      html.img( src: gravatar_src( user.email ) )
    end

    def profile_header
      user.username
    end

    def profile_meta
      user.email
    end

    def profile_description

    end

    def actors_count
      "#{format_number user_associations.actors.count} actors"
    end

    def locations_count
      "#{format_number user_associations.locations.count} locations"
    end

    private
    def user_associations
      @user_associations ||= UserAssociations.new user
    end
  end
end
