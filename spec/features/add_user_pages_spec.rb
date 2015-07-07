require 'rails_helper'

describe "the add user process" do

  it "adds a user" do
    visit root_path
    click_on "I NEW CAVE MAN"
    fill_in 'Name', with: "Rock"
    fill_in 'Email', with: "Rock@Rock.rk"
    fill_in 'Password', with: "password"
    fill_in 'user_password_confirmation', with: "password"
    click_button "Create User"
    expect(page).to have_content "WELCOME"
  end

  it "adds a user as an admin" do
    admin = FactoryGirl.create(:user, is_admin: true)
    log_in_rock
    click_on "NEW CAVE MENS"
    fill_in 'Name', with: "Rick"
    fill_in 'Email', with: "Rick@Rock.rk"
    fill_in 'Password', with: "password"
    fill_in 'user_password_confirmation', with: "password"
    click_button "Create User"
    expect(page).to have_content "WELCOME"
  end

  it "gets an error message for blank form" do
    visit new_user_path
    click_on 'Create User'
    expect(page).to have_content("can't be blank")
  end
end
