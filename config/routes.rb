Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations, :confirmations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :graphql, via: [:post]

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  get '*path', to: 'pages#home'
end
