require 'rails_helper'

describe "the edit and delete answers path" do

  it "deletes an answer" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    answer = FactoryGirl.create(:answer, user_id: user.id, question_id: question.id)
    log_in_rock
    visit question_path(question)
    click_link "delete_answer#{answer.id}"
    expect(page).to have_content "GONE. BRAIN STILL HURT"
  end

  it "edits an answer" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    answer = FactoryGirl.create(:answer, user_id: user.id, question_id: question.id)
    log_in_rock
    visit question_path(question)
    click_link "edit_answer#{answer.id}"
    fill_in "Content", with: "I AM A BANANA"
    click_button "Update Answer"
    expect(page).to have_content "BANANA"
  end

  it "returns an error on failed edit" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user_id: user.id)
    answer = FactoryGirl.create(:answer, user_id: user.id, question_id: question.id)
    log_in_rock
    visit question_path(question)
    click_link "edit_answer#{answer.id}"
    fill_in "Content", with: ""
    click_button "Update Answer"
    expect(page).to have_content "can't be blank"
  end

end
