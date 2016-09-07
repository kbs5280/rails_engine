Rails.application.routes.draw do
# use except instead of only as necessary
# except (exclude) new and edit since we never want json for those actions
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :merchants do
        # relationship endpoints
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
        # random

        #business logic
        # resources :most_revenue, only: [:index]
        get '/most_revenue', to: 'most_revenue#index'
        # resources :most_items, only: [:index]
        get '/most_items', to: 'most_items#index'
        # resources :revenue, only: [:index]
        get '/revenue', to: 'revenue#index'
        # /:id catches all paths beyond merchants
        get '/:id/revenue', to: 'revenue#show'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
        get '/:id/customer_with_pending_invoices', to: 'pending_invoices#show'
      end

      namespace :invoices do
        get 'find_all', to: 'find_all#index'
        get 'find', to: 'find#show'
      end

      # record endpoints
      resources :merchants, only: [:index, :show]
      # get '/merchants', to: 'merchants#index'
      # get '/merchants/:id', to: 'merchants#show'

      resources :items, only: [:index, :show]
      # get '/items', to: 'items#index'
      # get '/items/:id', to: 'items#show'

      resources :invoice_items, only: [:index, :show]
      # get '/invoice_items', to: 'invoice_items#index'
      # get '/invoice_items/:id', to: 'invoice_items#show'

      resources :invoices, only: [:index, :show]
      # get '/invoices', to: 'invoices#index'
      # get '/invoices/:id', to: 'invoices#show'

      resources :transactions, only: [:index, :show]
      # get '/transactions', to: 'transactions#index'
      # get '/transactions/:id', to: 'transactions#show'

      resources :customers, only: [:index, :show]
      # get '/customers', to: 'customers#index'
      # get '/customers/:id', to: 'customers#show'
    end
  end
end
