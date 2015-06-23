class Item < ActiveRecord::Base
  belongs_to :category
  has_many :photos

  accepts_nested_attributes_for :photos, :allow_destroy => true

  # def price
  #   number_to_currency self.price
  # end

  #TODO add validation: item can belongs to category without children only.
end
