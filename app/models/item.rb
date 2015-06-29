class Item < ActiveRecord::Base
  belongs_to :category
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos, :allow_destroy => true

  # def price
  #   number_to_currency self.price
  # end

  def main_photo
    photos.main_photos.first
  end

  #TODO add validation: item can belongs to category without children only.
end
