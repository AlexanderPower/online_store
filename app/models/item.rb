class Item < ActiveRecord::Base
  belongs_to :category

  def price
    number_to_currency self.price
  end
end
