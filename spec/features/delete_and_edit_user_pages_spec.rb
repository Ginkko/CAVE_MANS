require 'rails_helper'

describe "the delete and edit user process" do

  it "deletes a user as an admin" do
    test_user = FactoryGirl.create(:user, is_admin: true)
    visit log_in_path
    fill_in 'Email', with: "Rock@Rock.rk"
    fill_in 'Password', with: "smash"
    click_button 'CAVE ENTER'
    visit user_path(test_user)
    click_on "FIRE"
    expect(page).to have_content "BYE BYE"
  end

end
