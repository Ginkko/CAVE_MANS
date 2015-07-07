require 'rails_helper'

def log_in_rock
  visit log_in_path
  fill_in 'Email', with: "Rock@Rock.rk"
  fill_in 'Password', with: "smash"
  click_button 'CAVE ENTER'
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



end
