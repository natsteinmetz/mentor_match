require 'spec_helper'

feature 'Creating Mentorships' do

  before do
    @mentor = Factory(:mentor, :name => "Test Mentor")
    @mentee = Factory(:mentee, :name => "Test Mentee")
    visit '/'
  end

  scenario 'can create a mentorship association starting from mentor' do
    click_link 'See all mentors'
    page.should have_content(@mentor.name)
    click_link 'Test Mentor'
    page.should have_content(@mentor.name)
    click_link 'Add Mentee'
    page.should have_content('Add Mentorship Associations')

    page.select(@mentor.name, from: "mentorship_mentor_id")
    page.select(@mentee.name, from: "mentorship_mentee_id")
    click_button "Submit"
    redirect_to mentor_path(@mentor)
    page.should have_content("Mentorship has been created.")
  end

  scenario 'can create a mentorship association starting from mentee' do
    click_link 'See all mentees'
    page.should have_content(@mentee.name)
    click_link 'Test Mentee'
    page.should have_content(@mentee.name)
    click_link 'Add Mentor'
    page.should have_content('Add Mentorship Associations')

    page.select(@mentor.name, from: "mentorship_mentor_id")
    page.select(@mentee.name, from: "mentorship_mentee_id")
    click_button "Submit"
    redirect_to mentee_path(@mentee)
    page.should have_content("Mentorship has been created.")
  end

end
