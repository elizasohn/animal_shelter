Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :animals do
    collection do
      get 'random'
      get 'search'
    end
  end
end
