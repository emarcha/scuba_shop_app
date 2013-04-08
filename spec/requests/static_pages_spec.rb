require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do 
    it "should have the content 'The Lion Fish Scuba Shop'" do 
      visit '/static_pages/home'
      expect(page).to have_content('The Lion Fish Scuba Shop') 
    end 
  end 
  
  describe "Help page" do 
    it "should have the content 'Help'" do 
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end 
  end 
  
  describe "About" do 
    it "should have the content 'About Us'" do 
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end 
  end 
  
end
