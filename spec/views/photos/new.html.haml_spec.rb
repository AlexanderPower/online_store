require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      :image => "",
      :main => false,
      :item => nil
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_image[name=?]", "photo[image]"

      assert_select "input#photo_main[name=?]", "photo[main]"

      assert_select "input#photo_item_id[name=?]", "photo[item_id]"
    end
  end
end
