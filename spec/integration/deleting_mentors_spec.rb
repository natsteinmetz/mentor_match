require 'spec_helper'

feature "Deleting talks" do
  scenario "Deleting a talk" do
    Factory(:talk, :title => "My Test Talk")
    visit '/'
    click_link "My Test Talk"
    click_link "Delete Talk"
    page.should have_content("Talk has been deleted.")

    visit '/'
    page.should_not have_content("My Test Talk")
  end
end

