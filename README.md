# Rails Engine

-----

Contributors: [Kris Sparks](https://github.com/kbs5280) & [Lane Wihnham](https://github.com/Laner12) 

-----

In this project, we used Rails, ActiveRecord and SQL to build a JSON API which exposes the SalesEngine data schema.

  * We built Single-Responsibility controllers to provide a well-designed and versioned API.
  * We used controller tests to drive your design.
  * We used Ruby and ActiveRecord to perform complicated business intelligence queries.
  
-----

Featured Business Intelligence Endpoints:

We want to maintain the original Business Intelligence functionality of SalesEngine, but this time expose the data through our API.

All Merchants

GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue
GET /api/v1/merchants/most_items?quantity=x returns the top x merchants ranked by total number of items sold
GET /api/v1/merchants/revenue?date=x returns the total revenue for date x across all merchants

Single Merchant

GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions  
GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x  
GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.  
GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices  

Items

GET /api/v1/items/most_revenue?quantity=x returns the top x items ranked by total revenue generated  
GET /api/v1/items/most_items?quantity=x returns the top x item instances ranked by total number sold  
GET /api/v1/items/:id/best_day returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.  

Customers

GET /api/v1/customers/:id/favorite_merchant returns a merchant where the customer has conducted the most successful transactions  

-----

Takeaway:

This was our first exposure to more complex business logic using ActiveRecord and SQL the project timeframe was officially 3.5 days, which included our regular class schedule. In this limited time we were able successfully complete almost all of the business logic. Our test coverage was over 90%.

Given more time we would have liked to refactor our code, bolster our tests and complete the last 2 pieces of business logic.

