module Web::Controllers::Actors
  class Index
    include Web::Action

    expose :actors, :most_recent_actor, :most_encountered_actor, :newest_actor

    def call(params)
      @actors                 = ActorRepository.find_for_user(current_user.id ).all

      @most_recent_actor      = ActorRepository.find_most_recent_for_user(current_user.id )
      @most_encountered_actor = ActorRepository.find_most_encountered_for_user(current_user.id )
      @newest_actor           = ActorRepository.find_newest_for_user(current_user.id )
    end
  end
end
