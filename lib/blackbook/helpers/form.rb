module FormHelper

  ##
  # A drop down field
  #
  # @param [String|Symbol] name the form name
  # @param [mixed] value the current value
  # @param [String] default the default value
  # @param [TrueClass|FalseClass] search enable search
  # @param [Array] collection the collection with [[key, value]]
  #
  def dropdown_field( name, value: nil, default: 'Select', search: false, multiple: false, collection: )
    html.div( class: 'ui fluid ' + (search ? 'search ' : '') + 'selection dropdown', multiple: multiple ) do
      input name: name, value: value, type: :hidden
      i( class: 'dropdown icon' ) {}
      div( class: 'default text' ) do default end
      div( class: 'menu' ) do
        collection.map do |kv|
          div( class: 'item', :'data-value' => kv[0] ) do
            kv[1]
          end
        end
      end
    end
  end

end