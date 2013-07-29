require 'spec_helper'

feature "Editing Talks" do

  before do
    Factory(:talk, :title => "Test Talk")
    visit '/'
    click_link "Test Talk"
    click_link "Edit Talk"
  end

  scenario "Updating a talk" do
    fill_in "Title", :with => "Test Talk beta"
    click_button "Update Talk"
    page.should have_content("Talk has been updated.")
  end

  scenario "Updating a talk with invalid attributes is bad" do
    fill_in "Title", :with => ""
    click_button "Update Talk"
    page.should have_content("Talk has not been updated.")
  end

end

