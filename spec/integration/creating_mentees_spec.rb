require 'spec_helper'

feature 'Creating Mentee' do

  before do
    visit '/'
    click_link "See all mentees"
    click_link "New Mentee"
  end

  scenario 'can create a mentee' do
    fill_in 'Name', :with => 'Test Mentee'
    fill_in 'Email', :with => 'mentee@mentee.com'
    click_button 'Create Mentee'
    page.should have_content('Mentee has been created.')

    mentee = Mentee.find_by_name('Test Mentee')
    page.current_url.should == mentee_url(mentee)
    title = "Test Mentee - Mentees - Mentor Mentee Matchmaking"
    find("title").should have_content(title)
  end

  scenario "can not create a mentee without a title" do
    click_button "Create Mentee"
    page.should have_content("Mentee has not been created.")
    page.should have_content("Name can't be blank")
    page.should have_content("Email can't be blank")
  end
end

