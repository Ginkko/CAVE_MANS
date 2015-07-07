require 'rails_helper'

describe "the add user process" do
  it "adds a user" do
    test_user = FactoryGirl.create(:user)
    visit log_in_path
    fill_in 'Email', with: test_user.email
    fill_in 'Password', with: "smash"
    click_button 'CAVE ENTER'
    expect(page).to have_content 'YOU AM - Rock'
  end

end
