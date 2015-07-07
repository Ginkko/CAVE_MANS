require 'rails_helper'

describe "session pages" do

  it "Logs a user in" do
    test_user = FactoryGirl.create(:user)
    log_in_rock
    expect(page).to have_content("Rock")
  end

  it "Logs a user out" do
    test_user = FactoryGirl.create(:user)
    log_in_rock
    click_on "CAVE LEAVE"
    expect(page).to have_content "YOU LEAVE CAVE."
  end

  it "Shows an error when login fails" do
    test_user = FactoryGirl.create(:user)
    visit root_path
    click_on "CAVE ENTER"
    click_button "CAVE ENTER"
    expect(page).to have_content("PROBLEM LOG IN.")
  end

end
