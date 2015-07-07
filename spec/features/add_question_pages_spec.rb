require 'rails_helper'

describe "the add question process" do
  it "adds a new question" do
    test_user = FactoryGirl.create(:user)
    log_in_rock
    click_on "NEW BRAIN HURT"
    fill_in "Name", with: "why?"
    fill_in "Body", with: "srsly why?"
    click_on "Create Question"
    expect(page).to have_content 'why?'
  end

  it "gives and error for blank form" do
    test_user = FactoryGirl.create(:user)
    log_in_rock
    click_on "NEW BRAIN HURT"
    click_on "Create Question"
    expect(page).to have_content "can't be blank"
  end
end
