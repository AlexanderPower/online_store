class Category < ActiveRecord::Base
  has_many :child_categories, class_name: "Category",
           foreign_key: "parent_category_id"

  belongs_to :parent_category, class_name: "Category"

  # belongs_to :parent_category
  def self.build_tree(root_categories, depth)
    # root_categories.delete_if { |c| c.parent_category!=nil }
    root_categories.each do |category|
      puts "#{'..'*depth}#{category.name}"
      build_tree category.child_categories, depth+1
    end
  end

  def self.json_tree(nodes)
    json_tree2(nodes).to_json
  end



  def self.json_tree2(nodes)
    nodes.map do |node|
      {text: node.name, children: json_tree2(node.child_categories)}
    end
  end
  private_class_method :json_tree2
end
