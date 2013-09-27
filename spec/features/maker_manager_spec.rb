require 'spec_helper'

feature "Maker signs up" do 

	scenario "when being logged out" do
		lambda { sign_up }.should change(Maker, :count).by(1)    
  	expect(page).to have_content("Welcome, sam@sam.com")
  	expect(Maker.first.email).to eq("sam@sam.com")        
	end

	def sign_up(email = "sam@sam.com", 
              password = "Chingpu!",
              handle = "±Samsam",
              name = "Sam Harris")
    	visit '/makers/new'
    	fill_in :email, :with => email
    	fill_in :password, :with => password
    	fill_in :handle, :with => handle
    	fill_in :name, :with => name
    	click_button "Sign up"
  	end
end
