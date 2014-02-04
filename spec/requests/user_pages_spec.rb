require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit root }
    { click_button "Sign up now!"} 

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "with invalid information" do
      it "should not create a user" do
        expect { click_button 'Sign up' }.not_to change(User, :count)
      end
    end


	describe "with valid information" do
	  before do
	    fill_in "Name",         with: "Example User"
	    fill_in "Email",        with: "user@example.com"
	    fill_in "Password",     with: "foobar"
	    fill_in "Confirmation", with: "foobar"
	    fill_in "Industry", 	with: "Software"
	  end

	  it "should create a user" do
	    expect { click_button 'Sign up' }.to change(User, :count).by(1)
	  end
	end	
end