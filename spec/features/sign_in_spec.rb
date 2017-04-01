require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User Log In', :type => :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "Logged in" do
    scenario "signs in with valid user" do
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Submit'
      expect(page).to have_content 'Signed in successfully'
    end

    scenario "throws error with invalid data" do
      wrong_password = @user.password + "r"
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: wrong_password
      end
      click_button 'Submit'
      expect(page).to have_content 'Invalid Email or password'
    end

    scenario "shows admin link when user is admin" do
      role = Role.find_by(name: "Admin") || FactoryGirl.create(:role, :admin)
      user = FactoryGirl.create(:user, :role_id => role.id)
      if user.role_id != role.id
        user.role_id = role.id
        user.save
      end
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Submit'
      expect(page).to have_link('Admin')
    end


    scenario "Displays 'Create Survey' when user is logged in" do
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Submit'
      expect(page).to have_link('Create a survey')
    end

     scenario "Welcomes user and displays the user's username when logged in" do
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Submit'
      expect(page).to have_content("Hello #{@user.username}, from here you can:")
    end

    scenario "Hides Login button when logged in" do
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Submit'
      expect(page).to_not have_link('login')
    end

    scenario "Hides Sign up with facebook when logged in" do
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Submit'
      expect(page).to_not have_link('Sign up with Facebook')
    end

    scenario "Hides Sign up with email when logged in" do
      visit user_session_path
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Submit'
      expect(page).to_not have_link('Sign up with Email')
    end

  end
end
