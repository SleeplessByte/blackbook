module Web::Controllers::Locations
  class New
    include Web::Action

    expose :location

    def call( params )
      @location = Location.new
      @location.user_id = current_user.id
    end
  end
end
