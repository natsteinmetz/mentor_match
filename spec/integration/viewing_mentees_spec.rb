require 'spec_helper'

feature "Viewing mentees" do
  scenario "Listing all mentees" do
    mentee = Factory.create(:mentee, :name => "Test Mentee")
    visit '/'
    click_link 'See all mentees'
    click_link "Test Mentee"
    page.current_url.should == mentee_url(mentee)
  end
end

