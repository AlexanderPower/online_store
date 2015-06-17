require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :parent_category => nil
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_parent_category_id[name=?]", "category[parent_category_id]"
    end
  end
end
