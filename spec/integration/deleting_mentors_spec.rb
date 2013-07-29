require 'spec_helper'

feature "Deleting mentors" do
  scenario "Deleting a mentor" do
    Factory(:mentor, :name => "My Test Mentor")
    visit '/'
    click_link "My Test Mentor"
    click_link "Delete Mentor"
    page.should have_content("Mentor has been deleted.")

    visit '/'
    page.should_not have_content("My Test Mentor")
  end
end

