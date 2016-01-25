module Web::Controllers::Locations
  class Index
    include Web::Action

    expose :locations

    def call(params)
      @locations = LocationRepository.find_by_user( current_user.id ).all
    end
  end
end
