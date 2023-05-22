Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :product, only: [:index, :create, :get, :update, :delete]
    end
  end 
end
