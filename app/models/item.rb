class Item < ActiveRecord::Base
  belongs_to :category
  has_many :photos

  def price
    number_to_currency self.price
  end
end
