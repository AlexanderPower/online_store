require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :parent_category => nil
      ),
      Category.create!(
        :parent_category => nil
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
