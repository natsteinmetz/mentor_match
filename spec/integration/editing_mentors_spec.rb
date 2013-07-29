require 'spec_helper'

feature "Editing Mentors" do

  before do
    Factory(:mentor, :name => "Test Mentor")
    visit '/'
    click_link "Test Mentor"
    click_link "Edit Mentor"
  end

  scenario "Updating a mentor" do
    fill_in "Name", :with => "Test Mentor beta"
    click_button "Update Mentor"
    page.should have_content("Mentor has been updated.")
  end

  scenario "Updating a mentor with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Mentor"
    page.should have_content("Mentor has not been updated.")
  end

end

