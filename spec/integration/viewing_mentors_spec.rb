require 'spec_helper'

feature "Viewing mentors" do
  scenario "Listing all mentors" do
    mentor = Factory.create(:mentor, :name => "Test Mentor")
    visit '/'
    click_link "Test Mentor"
    page.current_url.should == mentor_url(mentor)
  end
end

