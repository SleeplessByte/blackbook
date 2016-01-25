module Web::Controllers::Interactions
  module SetInteraction
    def self.included( action )
      action.class_eval do
        before :set_interaction
        expose :interaction
        handle_exception RecordNotFound => 404
        handle_exception Forbidden => 403
      end
    end

    private

    def set_interaction( params )
      @interaction = InteractionRepository.find( params[:id] ) or raise RecordNotFound.new(
          "Looking for interaction with id = #{params[:id]}" )
    end
  end
end