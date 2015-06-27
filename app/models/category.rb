class Category < ActiveRecord::Base
  class << self
    include Rails.application.routes.url_helpers
  end

  has_many :child_categories, class_name: "Category",
           foreign_key: "parent_category_id"
  belongs_to :parent_category, class_name: "Category"
  has_many :items

  # belongs_to :parent_category
  def self.build_tree(root_categories, depth)
    # root_categories.delete_if { |c| c.parent_category!=nil }
    root_categories.each do |category|
      puts "#{'..'*depth}#{category.name}"
      build_tree category.child_categories, depth+1
    end
  end

  def previous_category
    return nil if not parent_category or parent_category.child_categories.length==1 or (index = parent_category.child_categories.index self)==0
    parent_category.child_categories[index-1]
  end

  def next_category
    return nil if not parent_category or parent_category.child_categories.length==1
    parent_category.child_categories[parent_category.child_categories.index(self)+1]
  end

  def self.json_tree(nodes)
    json_tree2(nodes).to_json
  end


  def self.json_tree2(nodes)
    nodes.map do |node|
      {id: node.id, text: node.name,li_attr:nil, a_attr:{href: category_path(node)}, children: json_tree2(node.child_categories)}
    end
  end

  private_class_method :json_tree2
end
