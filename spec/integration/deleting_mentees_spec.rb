require 'spec_helper'

feature "Deleting mentees" do
  scenario "Deleting a mentee" do
    Factory(:mentee, :name => "My Test Mentee")
    visit '/'
    click_link "See all mentees"
    click_link "My Test Mentee"
    click_link "Delete Mentee"
    page.should have_content("Mentee has been deleted.")

    visit '/'
    page.should_not have_content("My Test Mentee")
  end
end

