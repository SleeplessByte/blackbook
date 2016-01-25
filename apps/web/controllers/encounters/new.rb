module Web::Controllers::Encounters
  class New
    include Web::Action

    expose :encounter

    def call( params )
      @encounter = Encounter.new
      @encounter.actor_id = params[ :actor_id ]

      # TODO validate actor
    end
  end
end
