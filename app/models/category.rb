class Category < ActiveRecord::Base
  has_many :child_categories, class_name: "Category",
           foreign_key: "parent_category_id"

  belongs_to :parent_category, class_name: "Category"

  # belongs_to :parent_category
end
