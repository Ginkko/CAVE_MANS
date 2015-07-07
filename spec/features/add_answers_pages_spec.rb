require 'rails_helper'

describe "the add answers path" do

  it "adds an answer" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    log_in_rock
    visit question_path(question)
    click_on "ME KNOW"
    fill_in "Content", with: "BECAUSE SUN AND MOON"
    click_button "Create Answer"
    expect(page).to have_content "Rock SAY - BECAUSE SUN AND MOON"
  end

  it "returns an error on failed answer" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    log_in_rock
    visit question_path(question)
    click_on "ME KNOW"
    click_on "Create Answer"
    expect(page).to have_content "can't be blank"
  end



end
