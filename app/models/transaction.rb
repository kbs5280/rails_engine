class Transaction < ApplicationRecord
  belongs_to :invoice

  def self.find_random_transactions
    order("RANDOM()").limit(1)
  end
end
