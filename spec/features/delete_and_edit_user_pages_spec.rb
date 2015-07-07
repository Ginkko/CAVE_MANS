require 'rails_helper'

def log_in_rock
  visit log_in_path
  fill_in 'Email', with: "Rock@Rock.rk"
  fill_in 'Password', with: "smash"
  click_button 'CAVE ENTER'
end

def edit_rock
  click_on "CHANGE"
  fill_in 'Name', with: "Rick"
  fill_in 'Email', with: "Rick@Rock.rk"
  fill_in 'Password', with: "rickrules"
  fill_in 'user_password_confirmation', with: "rickrules"
  click_on 'Update User'
end

describe "the delete and edit user process" do

  it "deletes a user" do
    test_user = FactoryGirl.create(:user)
    log_in_rock
    visit user_path(test_user)
    click_on "FIRE"
    expect(page).to have_content "BYE BYE"
  end


  it "deletes a user as an admin" do
    test_user = FactoryGirl.create(:user, is_admin: true)
    log_in_rock
    visit users_path
    click_link test_user.name
    click_on "FIRE"
    expect(page).to have_content "BYE BYE"
  end

  it "deletes another user as an admin" do
    test_admin = FactoryGirl.create(:user, is_admin: true)
    test_user = FactoryGirl.create(:user, name: "Bertha", email: 'example@email.com')
    log_in_rock
    visit user_path(test_user)
    click_on 'FIRE'
    expect(page).to have_content test_user.name + ' BYE BYE'
  end



  it "edits a user as self" do
    test_user = FactoryGirl.create(:user)
    log_in_rock
    visit user_path(test_user)
    edit_rock
    expect(page).to have_content('Rick')
  end

  it "edits a user as admin" do
    test_user = FactoryGirl.create(:user, is_admin: true)
    test_user_2 = FactoryGirl.create(:user, name: "fish", email: "test@test.com")
    log_in_rock
    visit users_path
    click_on(test_user_2.name)
    edit_rock
    expect(page).to have_content('Rick')
  end

  it "gets an error message for blank form" do
    test_user = FactoryGirl.create(:user)
    log_in_rock
    visit edit_user_path(test_user)
    click_on 'Update User'
    expect(page).to have_content("can't be blank")
  end
end
