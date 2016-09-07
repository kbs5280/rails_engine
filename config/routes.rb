Rails.application.routes.draw do
# use except instead of only as necessary
# except (exclude) new and edit since we never want json there
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :merchants do
        resources :most_revenue, only: [:index]
        resources :most_items, only: [:index]
        resources :revenue, only: [:index]
        get '/:id/revenue', to: 'revenue#show'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
        get '/:id/customer_with_pending_invoices', to: 'pending_invoices#show'
      end
    end
  end
end
