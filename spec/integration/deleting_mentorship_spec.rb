require 'spec_helper'

feature 'Deleting Mentorships' do

  before do
    @mentor = Factory(:mentor, :name => "Test Mentor")
    @mentee = Factory(:mentee, :name => "Test Mentee")
    visit '/'
    click_link 'See all mentors'
    click_link 'Test Mentor'
    click_link 'Add Mentee'
    page.select(@mentor.name, from: "mentorship_mentor_id")
    page.select(@mentee.name, from: "mentorship_mentee_id")
    click_button "Submit"
  end

  scenario 'can delete a mentorship association' do
    click_link 'Remove Mentee'
    page.should_not have_content(@mentee.name)
    page.should have_content("Mentorship has been deleted.")
  end

end
