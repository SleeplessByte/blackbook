module Web::Views::Actors
  class Index
    include Web::View

    def actors_each
      actors
          .each do |actor|
        #.sort_by { |a| [a.name_first, a.name_last].each( &:strip ).reject( &:blank? ).join( ' ' ) }
        yield actor
      end
    end

    def actors_as_cards_each
      cards = []
      cards << Cards::Actor.new( most_recent_actor, ribbon: 'recent' ) if most_recent_actor
      cards << Cards::Actor.new( most_encountered_actor, ribbon: 'most' ) if most_encountered_actor
      cards << Cards::Actor.new( newest_actor, ribbon: 'newest' ) if newest_actor
      #cards << Cards::Actor.new( newest_actor, ribbon: 'newest' ) if newest_actor
      #cards << Cards::Actor.new( newest_actor, ribbon: 'newest' ) if newest_actor
      cards = cards.uniq
      actors.sample( 3 - cards.size ).each do |actor|
        cards << Cards::Actor.new( actor )
      end
      cards.each do |card|
        yield card
      end
    end

    def actors_count
      "#{format_number actors.size } actors"
    end

    def actor_first_name( actor )
      actor.name_first
    end

    def actor_last_name( actor )
      actor.name_last
    end

    def actor_phone( actor )
      actor.phone
    end

    def actor_path( actor )
      routes.actor_path( actor.id )
    end

    def edit_actor_path( actor )
      routes.edit_actor_path( actor.id )
    end

    def facebook_actor_path( actor )
      "https://facebook.com/#{ actor.facebook_id }"
    end

    def actor_has_facebook?( actor )
      actor.facebook_id && !actor.facebook_id.blank?
    end
  end
end
