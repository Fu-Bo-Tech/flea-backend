Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/graphiql')
  resources :graphql, via: [:post, :options]

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
