class Category < ActiveRecord::Base
  class << self
    include Rails.application.routes.url_helpers
  end

  scope :root_categories, -> { where(parent_category: nil) }

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

  def target_categories
    parent_category ? parent_category.child_categories : Category.root_categories
  end

  def previous_category
    target_categories=self.target_categories
    return nil if target_categories.length==1 or (index = target_categories.index self)==0
    target_categories[index-1]
  end

  def next_category
    target_categories=self.target_categories
    return nil if target_categories.length==1
    target_categories[target_categories.index(self)+1]
  end

  def self.json_tree(nodes)
    json_tree2(nodes).to_json
  end


  def self.json_tree2(nodes)
    nodes.map do |node|
      {
          id: node.id,
          text: node.name,
          state: {opened:true},
          a_attr: {href: category_path(node)},
          children: json_tree2(node.child_categories)
      }
    end
  end

  private_class_method :json_tree2
end
