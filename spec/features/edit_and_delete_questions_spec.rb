require 'rails_helper'

describe "the edit and delte questions path" do

  it "deletes a question" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    log_in_rock
    visit questions_path
    click_on question.name
    click_on "FIRE"
    expect(page).to have_content "GONE. BRAIN HURT NO AS MUCH"
  end

  it "edits a question as a user" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    log_in_rock
    visit question_path(question)
    click_on "CHANGE"
    fill_in "Name", with: "Bread"
    fill_in "Body", with: "WHYNOBREAD"
    click_button "Update Question"
    expect(page).to have_content "Bread"
  end

  it "returns an error on failed edit" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    log_in_rock
    visit edit_question_path(question)
    fill_in "Name", with: ""
    click_on "Update Question"
    expect(page).to have_content "can't be blank"
  end



end
