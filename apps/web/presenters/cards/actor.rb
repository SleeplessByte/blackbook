require_relative 'card'

module Cards
  class Actor < Card

    attr_reader :ribbon, :ribbon_color

    def initialize( actor, ribbon: nil, ribbon_color: '' )
      self.actor = actor
      self.ribbon = ribbon
      self.ribbon_color = ribbon_color
    end

    def link
      routes.actor_path( actor.id )
    end

    def has_header?
      true
    end

    def header
      [ actor.name_first, actor.name_last ].map( &:strip ).reject( &:empty? ).join( ' ' )
    end

    def has_ribbon?
      ribbon && !ribbon.blank?
    end

    def has_image?
      has_facebook_id? || has_email?
    end

    def has_facebook_id?
      actor.facebook_id && !actor.facebook_id.blank?
    end

    def has_email?
      actor.email && !actor.email.blank?
    end

    def image

      builder = html

      if has_ribbon?
        builder.span class: "ui #{ ribbon_color } ribbon label" do
          ribbon
        end
      end

      return builder.img( src: "https://graph.facebook.com/#{actor.facebook_id}/picture?type=large" ) if has_facebook_id?
      return builder.img( src: gravatar_src( actor.email ) ) if has_email?
      nil
    end
=begin
    def ==(other)
      other.is_a?( Cards::Actor ) && other.actor.id == actor.id
    end

    def hash
      actor.id
    end
=end
    protected
    attr_writer :ribbon, :ribbon_color
    attr_accessor :actor

    class New < Card

      def initialize
      end

      def link
        routes.new_actor_path
      end

      def has_image?
        true
      end

      def image
        builder = html

        builder.div( class: 'ui dimmer active' ) do
          div( class: 'content' ) do
            div( class: 'center' ) do
              button( class: 'ui icon inverted button' ) do
                i( class: 'icon add' ) {}
              end
            end
          end
        end

        builder.img( src: '/images/wireframe/image.png' )
      end

      def has_dimmer?
        true
      end

      def has_header?
        true
      end

      def header
        'Add new actor'
      end

    end
  end
end