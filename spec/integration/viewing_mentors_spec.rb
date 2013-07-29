require 'spec_helper'

feature "Viewing talks" do
  scenario "Listing all talks" do
    talk = Factory.create(:talk, :title => "Test Talk")
    visit '/'
    click_link "Test Talk"
    page.current_url.should == talk_url(talk)
  end
end

