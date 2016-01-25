require_relative 'set_encounter'

module Web::Controllers::Encounters
  class Edit
    include Web::Action
    include SetEncounter

    def call(params)
    end
  end
end
