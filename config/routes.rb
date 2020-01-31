Rails.application.routes.draw do
  resources :animals do
    collection do
      get 'random'
    end
  end
end
