Rails.application.routes.draw do
# use except instead of only as necessary
# except (exclude) new and edit since we never want json there
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :merchants do
        resources :most_revenue, only: [:index]
        resources :most_items, only: [:index]
        resources :revenue, only: [:index]
      end
    end
  end
end
