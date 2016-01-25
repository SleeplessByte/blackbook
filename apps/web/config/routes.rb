get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: 'logout'

get '/sign_up', to: 'registrations#new', as: 'sign_up'
post '/sign_up', to: 'registrations#create'

get '/profile', to: 'profile#show', as: 'profile'

resources 'actors'
resources 'encounters'
resources 'interactions'
resources 'locations'
resources 'location_types'
resources 'users'

get '/', to: 'home#index', as: 'root'

# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
