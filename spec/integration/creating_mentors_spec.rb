require 'spec_helper'

feature 'Creating Mentor' do

  before do
    visit '/'
    click_link "New Mentor"
  end

  scenario 'can create a mentor' do
    fill_in 'Name', :with => 'Test Mentor'
    fill_in 'Email', :with => 'mentor@mentor.com'
    fill_in 'Affiliation', :with => 'Test Affiliation'
    click_button 'Create Mentor'
    page.should have_content('Mentor has been created.')

    mentor = Mentor.find_by_name('Test Mentor')
    page.current_url.should == talk_url(mentor)
    title = "Test Mentor - Mentors - Mentor Mentee Matchmaking"
    find("title").should have_content(title)
  end

  scenario "can not create a mentor without a title" do
    click_button "Create Mentor"
    page.should have_content("Mentor has not been created.")
    page.should have_content("Name can't be blank.")
  end
end

