Railsbridge::Application.routes.draw do

  get 'register/edit', to: 'registrants#edit'
  resources :registrants do
    post :validate_email, on: :collection
    patch :update, on: :collection
    delete :cancel, on: :collection, as: :cancel
  end

  post "/mailer"  , to: 'messages#create' , as: :mailer

  # More information on localized routes here: https://github.com/enriclluelles/route_translator
  # Actual paths in locale files, i.e. config/locales/(en|fr).yml
  localized do
    get "/team"     , to: 'pages#team'
    get '/register' , to: 'registrants#new'
    get "/sponsors" , to: 'pages#sponsors'
    get "/conduct", to: 'pages#code_of_conduct'
    get "/supinfo"  , to: 'pages#supinfo'

    root 'pages#home'
  end

  # Quick fix for 404 from tweet
  get '/registration', to: redirect('/register')

end
