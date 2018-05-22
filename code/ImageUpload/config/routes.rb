Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/upload' => 'uploader#uploader'
  match '/upload' => 'uploader#upload_file', via: :post
end
