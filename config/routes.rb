Rails.application.routes.draw do
# use except instead of only as necessary
# except (exclude) new and edit since we never want json for those actions
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      # record endpoints
      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]

      namespace :merchants do

        # relationship endpoints

        #business logic
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
