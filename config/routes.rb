Railsbridge::Application.routes.draw do

  resources :registrants

  post "/mailer"  , to: 'messages#create' , as: :mailer

  localized do
    get "/team"     , to: 'pages#team'
    get '/register' , to: 'registrants#new'
    get "/sponsors" , to: 'pages#sponsors'

    root 'pages#home'
  end

end
