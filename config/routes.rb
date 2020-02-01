Rails.application.routes.draw do
  resources :animals do
    collection do
      get 'random'
      get 'search'
    end
  end
end
