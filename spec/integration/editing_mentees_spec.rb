require 'spec_helper'

feature "Editing Mentees" do

  before do
    Factory(:mentee, :name => "Test Mentee")
    visit '/'
    click_link "See all mentees"
    click_link "Test Mentee"
    click_link "Edit Mentee"
  end

  scenario "Updating a mentee" do
    fill_in "Name", :with => "Test Mentee beta"
    click_button "Update Mentee"
    page.should have_content("Mentee has been updated.")
  end

  scenario "Updating a mentee with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Mentee"
    page.should have_content("Mentee has not been updated.")
  end

end

