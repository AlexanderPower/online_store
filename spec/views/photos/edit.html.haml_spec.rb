require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :image => "",
      :main => false,
      :item => nil
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_image[name=?]", "photo[image]"

      assert_select "input#photo_main[name=?]", "photo[main]"

      assert_select "input#photo_item_id[name=?]", "photo[item_id]"
    end
  end
end
