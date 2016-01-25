require 'hanami/model'
Dir["#{ __dir__ }/blackbook/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/blackbook_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/blackbook_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/blackbook_development'
  #    adapter type: :sql, uri: 'mysql://localhost/blackbook_development'
  #
  adapter type: :sql, uri: ENV['BLACKBOOK_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping "#{__dir__}/config/mapping"
end.load!
