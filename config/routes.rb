Rails.application.routes.draw do
  root 'api#home'
  get '/api/getteam', to: 'api#get_team'
  get '/api/reset', to: 'api#reset'
  get '/api/zipalertlist', to: 'api#zip_alert_list'
  get '/api/alertlist', to: 'api#alert_list'
  get '/api/testcount', to: 'api#test_count'
  get '/api/getpatient/:mrn', to: 'api#get_patient'
  get '/api/gethospital/:id', to: 'api#get_hospital'
  # For details on the DSL available within this file, see
  # https://guides.rubyonrails.org/routing.html
end
