require 'hanami/view'
require 'hanami/helpers'

module Cards
  class Card
    include Hanami::Presenter
    include Hanami::Helpers
    include TimeDistanceHelper
    include GravatarHelper

    def routes
      Web::Routes
    end

    def link
      '#'
    end

    def ribbon_color
      ''
    end

    def has_header?
      false
    end

    def has_ribbon?
      false
    end

    def has_image?
      false
    end

    def has_dimmer?
      false
    end

    def has_content?
      false
    end

    def has_meta?
      false
    end

    def has_description?
      false
    end

    def has_extra?
      false
    end

  end
end