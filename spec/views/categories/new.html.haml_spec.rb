require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :parent_category => nil
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_parent_category_id[name=?]", "category[parent_category_id]"
    end
  end
end
