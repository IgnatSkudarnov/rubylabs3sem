Rails.application.routes.draw do
  get 'xml_transformer/input'

  get '/palind/view', to: 'xml_transformer#answer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
