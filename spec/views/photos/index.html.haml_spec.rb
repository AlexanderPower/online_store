require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :image => "",
        :main => false,
        :item => nil
      ),
      Photo.create!(
        :image => "",
        :main => false,
        :item => nil
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
